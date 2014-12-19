class Table
  attr_accessor :dimension
  attr_reader :map

  def initialize(dimension)
    @dimension = dimension

    @map = Array.new(@dimension.width)

    @map.map! { |column| column = Array.new(@dimension.height) }
  end

  def place(x, y, object)
    return if @map.length <= x or @map[x].length <= y
    @map[x][y] = object
  end

  def find(object)
    @map.each_with_index { |column, column_index|
      row_index = column.index(object)
      return Coordinate.new(column_index, row_index) if row_index
    }
  end
end
