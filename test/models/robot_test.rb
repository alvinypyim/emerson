require 'test_helper'
 
class RobotTest < ActiveSupport::TestCase

  def self.table
    table = Table.new(Rectangle.new(2, 2))
  end

  def self.create_robot_at(table, x, y, direction)
    robot = Robot.new(table, direction)
    
    table.place(x, y, robot)
    robot
  end

  test 'rotate left' do
    robot = Robot.new(nil, Direction::NORTH)

    robot.rotate Direction::LEFT

    assert_equal Direction::WEST, robot.direction
  end

  test 'rotate right' do
    robot = Robot.new(nil, Direction::EAST)

    robot.rotate Direction::RIGHT

    assert_equal Direction::SOUTH, robot.direction
  end

  test 'rotate left 270 degrees' do
    robot = Robot.new(nil, Direction::SOUTH)

    3.times { robot.rotate Direction::RIGHT }

    assert_equal Direction::EAST, robot.direction
  end

  test 'move north' do
    table = self.class.table
    robot = self.class.create_robot_at(table, 0, 0, Direction::NORTH)
    
    robot.move

    location = table.find(robot)

    assert_equal 0, location.x
    assert_equal 1, location.y
  end

  test 'move east' do
    table = self.class.table
    robot = self.class.create_robot_at(table, 0, 0, Direction::EAST)

    robot.move

    location = table.find(robot)

    assert_equal 1, location.x
    assert_equal 0, location.y
  end

  test 'move south' do
    table = self.class.table
    robot = self.class.create_robot_at(table, 0, 1, Direction::SOUTH)

    robot.move

    location = table.find(robot)

    assert_equal 0, location.x
    assert_equal 0, location.y
  end

  test 'move west' do
    table = self.class.table
    robot = self.class.create_robot_at(table, 1, 0, Direction::WEST)

    robot.move

    location = table.find(robot)

    assert_equal 0, location.x
    assert_equal 0, location.y
  end

  test 'prevent falling from north' do
    table = Table.new(Rectangle.new(1, 1))
    robot = self.class.create_robot_at(table, 0, 0, Direction::NORTH)
    
    Direction.absolute.length.times {
      robot.rotate Direction::RIGHT
      robot.move

      location = table.find(robot)

      assert_equal 0, location.x
      assert_equal 0, location.y
    }
  end
end
