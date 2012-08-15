class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    view = HypnosisView.alloc.initWithFrame(@window.bounds)
    @window.addSubview(view)

    @window.backgroundColor = UIColor.whiteColor
    @window.makeKeyAndVisible
    true
  end
end
