class AppDelegate

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    # Hide the status bar.
    UIApplication.sharedApplication.setStatusBarHidden(true) #, withAnimation:UIStatusBarAnimationFade)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    # Create our scroll view container.
    scrollView = UIScrollView.alloc.initWithFrame(@window.bounds)
    @window.addSubview(scrollView)

    # Add the hypnosis view.
    @view = HypnosisView.alloc.initWithFrame(@window.bounds)
    scrollView.addSubview(@view)

    # Sinze the scroll view and add zooming.
    scrollView.contentSize = @window.bounds.size
    scrollView.minimumZoomScale = 1.0
    scrollView.maximumZoomScale = 5.0

    # You will get a warning here, ignore it for now.
    scrollView.delegate = self

    if @view.becomeFirstResponder
      p "HypnosisView became the first responder"
    else
      p "HypnosisView could not become the first responder"
    end

    @window.backgroundColor = UIColor.whiteColor
    @window.makeKeyAndVisible
    true
  end

  # Delegate method required for zooming.
  def viewForZoomingInScrollView(scrollView)
    @view
  end
end
