class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    @window.rootViewController = ItemsController.alloc.init
    @window.rootViewController.wantsFullScreenLayout = true
    @window.backgroundColor = UIColor.whiteColor
    @window.makeKeyAndVisible

    true
  end
end
