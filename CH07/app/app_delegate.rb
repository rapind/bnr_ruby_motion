class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    hypnosis = HypnosisController.alloc.init
    time = TimeController.alloc.init
    map = MapController.alloc.init
    tab_bar = UITabBarController.alloc.init
    tab_bar.viewControllers = [hypnosis, time, map]

    @window.rootViewController = tab_bar
    @window.rootViewController.wantsFullScreenLayout = true
    @window.backgroundColor = UIColor.whiteColor
    @window.makeKeyAndVisible
    true
  end
end
