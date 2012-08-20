class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    # So much cleaner to use bubble-wrap for notifications.
    App.notification_center.observe UIDeviceOrientationDidChangeNotification do |notification|
      p "orientationChanged: #{notification.object.orientation}"
    end

    @window.rootViewController = HeavyController.alloc.init
    @window.rootViewController.wantsFullScreenLayout = true
    @window.backgroundColor = UIColor.whiteColor
    @window.makeKeyAndVisible
    true
  end

end
