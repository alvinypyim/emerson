class Table
  attr_accessor :dimension
  attr_reader :map

  def initialize(dimension)
    @dimension = dimension

    @map = Array.new(@dimension.width)

    @map.map! { |column| column = Array.new(@dimension.height) }
  end

  def place(location, object)
    return unless contain? location
    @map[location.x][location.y] = object
  end

  def find(object)
    @map.each_with_index { |column, column_index|
      row_index = column.index(object)
      return Coordinate.new(column_index, row_index) if row_index
    }
  end

  # Determine if the given location is on the surface of the table
  def contain?(location)
    @map.map.with_index { |v, i| i }.include? location.x and
    @map[location.x].map.with_index { |v, i| i }.include? location.y
  end
end
