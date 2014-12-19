require 'test_helper'
 
class TableTest < ActiveSupport::TestCase

  def self.place(table, x, y)
    object = Object.new

    table.place x, y, object
    object
  end

  test 'place at the centre' do
    table = Table.new(Rectangle.new(3, 3))

    object = self.class.place(table, 1, 1)

    assert_equal object, table.map[1][1]
  end

  test 'place at the sw corner' do
    table = Table.new(Rectangle.new(2, 2))

    object = self.class.place(table, 0, 0)

    assert_equal object, table.map[0][0]
  end

  test 'place at the nw corner' do
    table = Table.new(Rectangle.new(2, 2))

    object = self.class.place(table, 0, 1)

    assert_equal object, table.map[0][1]
  end

  test 'place at the ne corner' do
    table = Table.new(Rectangle.new(2, 2))

    object = self.class.place(table, 1, 1)

    assert_equal object, table.map[1][1]
  end

  test 'place at the se corner' do
    table = Table.new(Rectangle.new(2, 2))

    object = self.class.place(table, 1, 0)

    assert_equal object, table.map[1][0]
  end

  test 'place outside the west boundary' do
    table = Table.new(Rectangle.new(3, 3))

    object = self.class.place(table, -1, 1)

    table.map.each { |column|
      assert_equal 3, column.count(nil)
    }
  end

  test 'place outside the north boundary' do
    table = Table.new(Rectangle.new(3, 3))

    object = self.class.place(table, 1, 3)

    table.map.each { |column|
      assert_equal 3, column.count(nil)
    }
  end

  test 'place outside the east boundary' do
    table = Table.new(Rectangle.new(3, 3))

    object = self.class.place(table, 4, 1)

    table.map.each { |column|
      assert_equal 3, column.count(nil)
    }
  end

  test 'place outside the south boundary' do
    table = Table.new(Rectangle.new(3, 3))

    object = self.class.place(table, 1, -1)

    table.map.each { |column|
      assert_equal 3, column.count(nil)
    }
  end

  test 'find an object' do
    table = Table.new(Rectangle.new(2, 2))

    object = Object.new
    table.map[1][0] = object
    location = table.find(object)

    assert_not_nil location
    assert_equal 1, location.x
    assert_equal 0, location.y
  end
end
