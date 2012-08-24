class Item
  attr_accessor :name, :serial, :value, :createdAt

  def initialize(name = "Item", value = 0, serial = "")
    @name = name
    @value = value
    @serial = serial
    @createdAt = Time.now
  end

  def self.randomItem
    # Get a random adjective.
    adjective = ["Fluffy", "Rusty", "Shiny"].sample
    # Get a random noun.
    noun = ["Bear", "Spork", "Mac"].sample
    # Create a name using the adjective and noun.
    name = "#{adjective} #{noun}"
    
    # Create a random vaue.
    value = rand(100)

    # Create a randm serial number.
    # Note: RubyMotion doesn't support rand(range) yet. I.e. rand(10..35) won't work, so we use rand(25) + 10 instead.
    serial = "0#{rand(10)}A#{(rand(25) + 10).to_s(36).upcase}0#{rand(10)}A#{(rand(25) + 10).to_s(36).upcase}0#{rand(10)}"

    # Return a new item.
    Item.new(name, value, serial)
  end

  # Note: description is aliased to to_s
  def to_s
    "#{name} (#{serial}): Worth #{value}, recorded on #{createdAt}"
  end

end