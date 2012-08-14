class WhereamiController < UIViewController

  def init
    super
    @locationManager = BW::Location
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

    # Add the activity indicator (spinner).
    @activityIndicator = subview(UIActivityIndicatorView,
      left: 142, top: 59,
      width: 37, height: 37,
      hidesWhenStopped: true)

    # Add the map type selector.
    @mapTypeSelector = subview(
      UISegmentedControl.alloc.initWithItems(%w( Map Sat Hybrid)),
      left: 20, top: view.bounds.size.height - 60,
      width: 280, height: 44,
      selectedSegmentIndex: 0)

    # Handle the selection event.
    @mapTypeSelector.when(UIControlEventValueChanged) do
      @map.mapType = @mapTypeSelector.selectedSegmentIndex
    end
  end

  # DELEGATE METHODS
  # ****

  # Delegate method launched when the location title field changes.
  # TODO: It would be nice to have a callback for this, instead of a delegate method.
  def textFieldShouldReturn(textField)
    findLocation
    textField.resignFirstResponder
    true
  end

  # Delegate method for the map that's called whenever there's a location change.
  # TODO: It would be nice to have a callback for this, instead of a delegate method.
  def mapView(mapView, didUpdateUserLocation: userLocation)
    region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 250, 250)
    @map.setRegion(region, animated: true)
  end


  # CUSTOM METHODS
  # ****

  # Use the location manager to track the current location.
  def findLocation
    @locationManager.get do |result|
      # How many seconds ago was this new location created?
      t = result[:to].timestamp.timeIntervalSinceNow
      
      # CLLocationManagers will return the last found location of the 
      # device first, you don't want that data in this case.
      # Unless this location was made less than 3 minutes ago, ignore it.
      foundLocation(result[:to]) unless t < -180
    end
    @activityIndicator.startAnimating
    @locationTitleField.setHidden(true)
  end

  # We have a new location, so update the map.
  def foundLocation(location)
    coordinate = location.coordinate
    
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
    @locationManager.stop
  end

end