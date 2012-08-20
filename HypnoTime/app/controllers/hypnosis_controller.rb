class HypnosisController < UIViewController

  def init
    if super
      self.tabBarItem.title = "Hypnosis"
      self.tabBarItem.setImage(UIImage.imageNamed("13-target.png"))
    end
    self
  end

  def loadView
    self.view = HypnosisView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
  end

  def viewDidLoad
    super
    p "Hypnosis controller loaded it's view."
  end

end