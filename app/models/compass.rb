# Compass is able to resolve the relative directions
class Compass
  attr_accessor :directions, :direction_hash

  # Construct a ciruclar linked-list representing the compass directions
  def initialize

    self.directions = Array.new(Direction.absolute.length)
    self.direction_hash = { }

    Direction.absolute.each_with_index { |direction, index|

      directions[index] = CompassItem.new(
        Direction.absolute[index - 1],
        direction,
        Direction.absolute[index + 1]
      )

      direction_hash[direction] = directions[index]
    }

    directions.last.right = Direction.absolute.first
  end

  # Return the direction on this compass
  # Use left/right to explore the other directions
  def get_direction(direction)
    direction_hash[direction]
  end
end
