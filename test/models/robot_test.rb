require 'test_helper'
 
class RobotTest < ActiveSupport::TestCase

  def self.table
    table = Table.new(Rectangle.new(2, 2))
  end

  test 'rotate left' do
    robot = Robot.new(nil, Direction::NORTH)

    robot.rotate Direction::LEFT

    assert_equal robot.direction, Direction::WEST
  end

  test 'rotate right' do
    robot = Robot.new(nil, Direction::EAST)

    robot.rotate Direction::RIGHT

    assert_equal robot.direction, Direction::SOUTH
  end

  test 'rotate left 270 degrees' do
    robot = Robot.new(nil, Direction::SOUTH)

    3.times { robot.rotate Direction::RIGHT }

    assert_equal robot.direction, Direction::WEST
  end

  test 'move north' do
    table = self.class.table
    robot = Robot.new(table, Direction::NORTH)
    
    table.place(0, 0, robot)
    robot.move

    location = table.find(robot)

    assert_equal location.x, 0
    assert_equal location.y, 1
  end

  test 'move east' do
    table = self.class.table
    robot = Robot.new(table, Direction::EAST)
    
    table.place(0, 0, robot)
    robot.move

    location = table.find(robot)

    assert_equal location.x, 1
    assert_equal location.y, 0
  end
end
