# Item on a compass, ie. directions
class CompassItem

  # Value is the value of this item
  # Left and right are for the next items in both direction, eg if value is
  # north, left will be west
  attr_accessor :left, :value, :right

  def initialize(left, value, right)
    @left = left
    @value = value
    @right = right
  end
end
