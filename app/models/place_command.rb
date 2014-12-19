class PlaceCommand
  attr_accessor :location, :direction

  def initialize(location, direction)
    @location = location
    @direction = direction
  end
end
