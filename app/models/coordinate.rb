class Coordinate
  attr_accessor :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end

  # Add a relative coordinate
  def +(coordinate)
    return if not coordinate.is_a? Coordinate
    Coordinate.new(@x + coordinate.x, @y + coordinate.y)
  end
end
