class ItemStore

  attr_accessor :items

  def self.sharedStore
    @@sharedStore ||= allocWithZone(nil).init
  end

  # Make sure no one can instantiate additional item stores.
  def self.allocWithZone(zone)
    @@sharedStore ||= super(zone)
  end

  def init
    if super
      @items = []
    end
    self
  end

  def createItem
    item = Item.randomItem
    @items << item
    item
  end

end