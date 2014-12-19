require 'test_helper'
 
class TableTest < ActiveSupport::TestCase

  def self.place(table, x, y)
    object = Object.new

    table.place 0, 0, object
    object
  end

  test 'place at the centre' do
    table = Table.new(Rectangle.new(3, 3))

    object = self.class.place(table, 1, 1)

    assert_equal table.map[1][1], object
  end

  test 'place at the sw corner' do
    table = Table.new(Rectangle.new(2, 2))

    object = self.class.place(table, 0, 0)

    assert_equal table.map[0][0], object
  end

  test 'place at the nw corner' do
    table = Table.new(Rectangle.new(2, 2))

    object = self.class.place(table, 0, 1)

    assert_equal table.map[0][1], object
  end

  test 'place at the ne corner' do
    table = Table.new(Rectangle.new(2, 2))

    object = self.class.place(table, 1, 1)

    assert_equal table.map[1][1], object
  end

  test 'place at the se corner' do
    table = Table.new(Rectangle.new(2, 2))

    object = self.class.place(table, 1, 0)

    assert_equal table.map[1][0], object
  end

  test 'place outside the west boundary' do
    table = Table.new(Rectangle.new(3, 3))

    object = self.class.place(table, -1, 1)

    table.map.each { |column|
      assert_equal column.count(nil), 3
    }
  end

  test 'place outside the north boundary' do
    table = Table.new(Rectangle.new(3, 3))

    object = self.class.place(table, 1, 3)

    table.map.each { |column|
      assert_equal column.count(nil), 3
    }
  end

  test 'place outside the east boundary' do
    table = Table.new(Rectangle.new(3, 3))

    object = self.class.place(table, 4, 1)

    table.map.each { |column|
      assert_equal column.count(nil), 3
    }
  end

  test 'place outside the south boundary' do
    table = Table.new(Rectangle.new(3, 3))

    object = self.class.place(table, 1, -1)

    table.map.each { |column|
      assert_equal column.count(nil), 3
    }
  end

  test 'find an object' do
    table = Table.new(Rectangle.new(2, 2))

    object = Object.new
    table.map[1][0] = object
    location = table.find(object)

    assert_not_nil location
    assert_equal location.x, 1
    assert_equal location.y, 0
  end
end
