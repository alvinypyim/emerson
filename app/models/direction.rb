class Direction
  NORTH = :north
  EAST = :east
  SOUTH = :sout
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
