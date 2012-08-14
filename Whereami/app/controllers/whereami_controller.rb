class WhereamiController < UIViewController

  def init
    super

    # Create location manager object
    @locationManager = CLLocationManager.alloc.init

    # There will be a warning from this line of code; ignore it for now
    @locationManager.setDelegate(self)

    # And we want it to be as accurate as possible
    # regardless of how much time/power it takes
    @locationManager.setDesiredAccuracy(KCLLocationAccuracyBest)

    self
  end

  layout do
    # Add the map.
    @map = subview(MKMapView,
      frame: UIScreen.mainScreen.bounds,
      mapType: 0,
      delegate: self)
    @map.showsUserLocation = true

    # Add the location title field.
    @locationTitleField = subview(UITextField, 
      left: 66, top: 30,
      width: 189, height: 31,
      placeholder: "Enter Location Name",
      borderStyle: UITextBorderStyleRoundedRect,
      returnKeyType: UIReturnKeyDone,
      textAlignment: UITextAlignmentCenter,
      font: UIFont.systemFontOfSize(14),
      contentVerticalAlignment: UIControlContentVerticalAlignmentCenter,
      delegate: self)

    # Add the activity indicator (spinner)
    @activityIndicator = subview(UIActivityIndicatorView,
      left: 142, top: 59,
      width: 37, height: 37,
      hidesWhenStopped: true)

    # Add the map type selector
    subview(
      UISegmentedControl.alloc.initWithItems(%w( Map Sat Hybrid)),
      left: 20, top: view.bounds.size.height - 60,
      width: 280, height: 44,
      selectedSegmentIndex: 0).addTarget(self, action:'selectMap:', forControlEvents:UIControlEventValueChanged)
  end

  # Target action for the map type selector.
  def selectMap(selector)
    @map.mapType = selector.selectedSegmentIndex
  end

  # Delegate method launched when the location title field changes.
  def textFieldShouldReturn(textField)
    findLocation
    textField.resignFirstResponder
    true
  end

  # Use the location manager to track the current location.
  def findLocation
    @locationManager.startUpdatingLocation
    @activityIndicator.startAnimating
    @locationTitleField.setHidden(true)
  end

  # Delegate method for the location manager whenever there's a location change.
  def locationManager(manager, didUpdateToLocation: newLocation, fromLocation: oldLocation)
    # How many seconds ago was this new location created?
    t = newLocation.timestamp.timeIntervalSinceNow
    
    # CLLocationManagers will return the last found location of the 
    # device first, you don't want that data in this case.
    # If this location was made more than 3 minutes ago, ignore it.
    return if t < -180 # This is cached data, you don't want it, keep looking
    
    foundLocation(newLocation)
  end

  # Delegate method for the location manager when something goes wrong.
  def locationManager(manager, didFailWithError: error)
      p "Could not find location: #{error}"
  end

  # We have a new location, so update the map.
  def foundLocation(loc)
    coordinate = loc.coordinate
    
    # Create an instance of MapPoint with the current data
    mapPoint = BNRMapPoint.new(coordinate: coordinate, title: @locationTitleField.text)

    # Add it to the map view 
    @map.addAnnotation(mapPoint)

    # Zoom the region to this location
    region = MKCoordinateRegionMakeWithDistance(coordinate, 250, 250);
    @map.setRegion(region, animated: true)
    
    @locationTitleField.text = ""
    @activityIndicator.stopAnimating
    @locationTitleField.hidden = false
    @locationManager.stopUpdatingLocation
  end

  # Delegate method for the map that's called whenever there's a location change.
  def mapView(mapView, didUpdateUserLocation: userLocation)
    region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 250, 250)
    @map.setRegion(region, animated: true)
  end

end