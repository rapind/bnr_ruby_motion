Teacup::Stylesheet.new(:heavy_view) do

  style :root,
    landscape: true

  style :slider,
    left: 25, top: 35,
    width: 270, height: 25,
    landscape: {
      width: 430
    }

  style :image,
    left: 25, top: 75,
    width: 270, height: 325,
    backgroundColor: UIColor.grayColor,
    image: UIImage.imageNamed('nyan_cat.png'),
    contentMode: UIViewContentModeScaleAspectFit,
    landscape: {
      width: 430, height: 165
    }

  style :left_button,
    left: 25, top: 420,
    width:  50, height: 50,
    landscape: {
      top: 260
    }

  style :right_button,
    left: 245, top: 420,
    width:  50, height: 50,
    landscape: {
      left: 405, top: 260
    }

end

class HeavyController < UIViewController
  stylesheet :heavy_view

  layout :root do
    slider = subview(UISlider, :slider)
    image = subview(UIImageView, :image)
    leftButton = subview(UIButton.buttonWithType(UIButtonTypeRoundedRect), :left_button)
    rightButton = subview(UIButton.buttonWithType(UIButtonTypeRoundedRect), :right_button)
  end

  def shouldAutorotateToInterfaceOrientation(toInterfaceRotation)
    # Return true if the incoming orientation is not upside down portrait
    toInterfaceRotation != UIInterfaceOrientationPortraitUpsideDown
  end

end