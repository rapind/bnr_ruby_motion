class HypnosisView < UIView

  attr_reader :circleColor

  def initWithFrame(frame)
    if super
      # All hypnosis views start with a clear background color.
      self.backgroundColor = UIColor.clearColor
      @circleColor = UIColor.lightGrayColor
    end

    self
  end
  
  def drawRect(dirtyRect)
    ctx = UIGraphicsGetCurrentContext()
    bounds = self.bounds

    # Figure out the center of the bounds rectangle.
    center = CGPointMake( bounds.origin.x + (bounds.size.width / 2), bounds.origin.y + (bounds.size.height / 2) )

    # The radius of the circle should be nearly as big as the view.
    maxRadius = Math.hypot(bounds.size.width, bounds.size.height) / 2

    # The thickness of the line should be 10 points wide.
    CGContextSetLineWidth(ctx, 10)

    @circleColor.setStroke

    maxRadius.step(0, -20).each do |radius|
      # Add a path to the context.
      CGContextAddArc(ctx, center.x, center.y, radius, 0.0, Math::PI * 2.0, false)

      # Perform a drawing instruction; draw current shape with current state.
    CGContextStrokePath(ctx)
    end

    text = "You are getting sleepy."
    font = UIFont.boldSystemFontOfSize(28)
    textRect = CGRect.new
    
    # How big is the string when drawn in this font?
    textRect.size = text.sizeWithFont(font)

    # Let's put that string in the center of the view.
    textRect.origin.x = center.x - textRect.size.width / 2
    textRect.origin.y = center.y - textRect.size.height / 2

    # Set the fill color of the current context to black.
    UIColor.blackColor.setFill

    # The shadow will move 4 points to the right and 3 points down from the text.
    offset = CGSizeMake(4, 3)

    # The shadow will be dark gray in color.
    color = UIColor.darkGrayColor.CGColor

    # Set the shadow of the context with these paramters, all subsequent drawing will be shadowed.
    CGContextSetShadowWithColor(ctx, offset, 2.0, color)

    # Draw the string.
    text.drawInRect(textRect, withFont:font)
  end

  def canBecomeFirstResponder
    true
  end

  # Specify a custom writer to trigger the setNeedsDisplay event.
  def circleColor=(circleColor)
    @circleColor = circleColor
    setNeedsDisplay
  end

  def motionBegan(motion, withEvent:event)
    if motion == UIEventSubtypeMotionShake
      p "Device started shaking!"
      self.circleColor = UIColor.redColor
    end
  end

end