class Robot
  attr_accessor :table, :direction

  def initialize(table, direction)
    @table = table
    @direction = direction
  end

  # Look at the table to see if the robot will fall off before moving
  def move
    origin = @table.find(self)

    # Check if the robot can move without falling off the table
    case @direction
      when Direction::NORTH
        movement = Coordinate.new(0, 1)
      when Direction::EAST
        movement = Coordinate.new(1, 0)
      when Direction::SOUTH
        movement = Coordinate.new(0, -1)
      when Direction::WEST
        movement = Coordinate.new(-1, 0)
    end
    destination = origin + movement
    return unless @table.contain? destination

    # Safe to move
    @table.place origin, nil
    @table.place destination, self
  end

  # Use a compass to resolve the relative direction (left/right)
  def rotate(direction)
    @direction = Compass.new.get_direction(@direction).resolve(direction)
  end
end
