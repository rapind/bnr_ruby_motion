class HypnosisController < UIViewController

  def loadView
    # Create a view.
    @view = HypnosisView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
  end

end