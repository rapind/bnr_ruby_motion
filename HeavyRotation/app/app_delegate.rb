class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    @window.rootViewController = HeavyController.alloc.init
    @window.rootViewController.wantsFullScreenLayout = true
    @window.backgroundColor = UIColor.whiteColor
    @window.makeKeyAndVisible

    # So much cleaner to use bubble-wrap for notifications.
    App.notification_center.observe UIDeviceOrientationDidChangeNotification do |notification|
      p "orientationChanged: #{notification.object.orientation}"
    end

    App.notification_center.observe UIDeviceProximityStateDidChangeNotification do |notification|
      p "proximityChanged: #{notification.object.proximityState}"
      @window.rootViewController.view.backgroundColor = notification.object.proximityState ? UIColor.darkGrayColor : UIColor.clearColor
    end

    true
  end

end
