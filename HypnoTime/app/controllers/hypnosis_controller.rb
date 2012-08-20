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

  layout do

    @selector = subview(
      UISegmentedControl.alloc.initWithItems(%w( Red Green Blue)),
      left: 20, top: view.bounds.size.height - 160,
      width: 280, height: 44)

    # Handle the selection event.
    @selector.when(UIControlEventValueChanged) do
      case @selector.selectedSegmentIndex
      when 0
        color = UIColor.redColor
      when 1
        color = UIColor.greenColor
      when 2
        color = UIColor.blueColor
      else
        color = UIColor.lightGrayColor
      end

      self.view.circleColor = color
    end

  end

  def viewDidLoad
    super
    p "Hypnosis controller loaded it's view."
  end

end