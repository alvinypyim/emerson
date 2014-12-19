class Robot
  attr_accessor :table, :direction

  def initialize(table, direction)
    @table = table
    @direction = direction
  end

  def move
    location = @table.find(self)

    @table.place location, nil

    case @direction
      when Direction::NORTH
        location.y = location.y + 1
      when Direction::EAST
        location.x = location.x + 1
      when Direction::SOUTH
        location.y = location.y - 1
      when Direction::WEST
        location.x = location.x - 1
    end

    @table.place location, self
  end

  def rotate(direction)
    @direction = Compass.new.get_direction(@direction).resolve(direction)
  end
end
