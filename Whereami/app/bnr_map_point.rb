class BNRMapPoint

  def initialize(options)
    @coordinate = options[:coordinate] || CLLocationCoordinate2DMake(43.07, -89.32)
    @title = options[:title] || "Hometown"
    @subtitle = Time.now.strftime("%b %d, %Y at %I:%M %p")
  end

  # attr_reader and attr_accessor currently don't play well with protocals,
  # so we need to explicitly define protocal methods (coordinate, title, etc.).
  def coordinate
    @coordinate
  end

  def setCoordinate(coordinate)
    @coordinate = coordinate
  end

  def title
    @title
  end

  def subtitle
    @subtitle
  end

end