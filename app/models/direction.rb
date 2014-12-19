class Direction
  NORTH = :north
  EAST = :east
  SOUTH = :south
  WEST = :west

  LEFT = :left
  RIGHT = :right

  def self.absolute
    [ NORTH, EAST, SOUTH, WEST ]
  end

  def self.relative
    [ LEFT, RIGHT ]
  end
end
