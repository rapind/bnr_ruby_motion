class MapController < UIViewController

  def init
    if super
      self.tabBarItem.title = "Map"
      self.tabBarItem.setImage(UIImage.imageNamed("103-map.png"))
    end
    self
  end

  layout do
    @map = subview(MKMapView,
      frame: UIScreen.mainScreen.bounds)
  end

end