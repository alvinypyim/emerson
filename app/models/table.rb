class Table
  attr_accessor :dimension
  attr_reader :map

  def initialize(dimension)
    @dimension = dimension

    @map = Array.new(@dimension.width)

    @map.map! { |column| column = Array.new(@dimension.height) }
  end

  def place(x, y, object)
  end

  def find(object)
  end
end
