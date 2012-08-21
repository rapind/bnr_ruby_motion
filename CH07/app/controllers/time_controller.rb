class TimeController < UIViewController

  def init
    if super
      self.tabBarItem.title = "Time"
      self.tabBarItem.setImage(UIImage.imageNamed("11-clock.png"))
    end
    self
  end

  layout do

    @label = subview(UILabel,
      left: 25, top: 50,
      width:  270, height: 50,
      text: "???",
      textAlignment: UITextAlignmentCenter)

    button = subview(UIButton.buttonWithType(UIButtonTypeRoundedRect), 
      left: 25, top: 150,
      width:  270, height: 50,
      title:  "What time is it?")

    button.when(UIControlEventTouchUpInside) { showCurrentTime }
  end

  def showCurrentTime
    @label.text = Time.now.strftime("%H:%M:%S")
  end

  def viewDidLoad
    super
    p "Time controller loaded it's view."
    self.view.setBackgroundColor(UIColor.greenColor)
  end

  def viewDidUnload
    super
    p "Unloading time controllers subviews."
    @label = nil
  end

  def viewWillAppear(animated)
    p "Time controller view will appear."
    super
    showCurrentTime
  end

  def viewWillDisappear(animated)
    p "Time controller view will disappear."
    super
  end

end