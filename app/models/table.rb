class Table
  attr_accessor :dimension
  attr_reader :map

  def initialize(dimension)
    @dimension = dimension

    @map = Array.new(@dimension.width)

    @map.map! { |column| column = Array.new(@dimension.height) }
  end
end
