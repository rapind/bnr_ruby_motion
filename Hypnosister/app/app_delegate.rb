class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    view = HypnosisView.alloc.initWithFrame(@window.bounds)
    @window.addSubview(view)
    if view.becomeFirstResponder
      p "HypnosisView became the first responder"
    else
      p "HypnosisView could not become the first responder"
    end

    @window.backgroundColor = UIColor.whiteColor
    @window.makeKeyAndVisible
    true
  end
end
