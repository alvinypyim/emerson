# Item on a compass, ie. directions
class CompassItem

  # Value is the value of this item
  # Left and right are for the next items in both direction, eg if value is
  # north, left will be west
  attr_accessor :left, :value, :right

  # Store the relative directions as a hash
  attr_accessor :relative_hash

  def initialize(left, value, right)
    @left = left
    @value = value
    @right = right
    @relative_hash = { left: left, right: right }
  end

  # Resolve relative direction
  def resolve(direction)
    @relative_hash[direction]
  end
end
