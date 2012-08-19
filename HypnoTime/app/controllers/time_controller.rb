class TimeController < UIViewController

  def layout

    @label = subview(UILabel,
      left: 25, top: 50,
      width:  270, height: 50,
      text: "???",
      textAlignment: UITextAlignmentCenter)

    @button = subview(UIButton.buttonWithType(UIButtonTypeRoundedRect), 
      left: 25, top: 150,
      width:  270, height: 50,
      title:  "What time is it?")

  end

end