class Robot
  attr_accessor :table, :direction

  def initialize(table, direction)
    @table = table
    @direction = direction
  end

  def move
  end

  def rotate(direction)
    @direction = Compass.new.get_direction(@direction).resolve(direction)
  end
end
