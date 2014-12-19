require 'test_helper'
 
class RobotManagerTest < ActiveSupport::TestCase
  def self.table
    Table.new Rectangle.new(5, 5)
  end

  test 'valid movement 1' do
    manager = RobotManager.new(self.class.table)

    manager.send_command 'PLACE 0,0,NORTH'
    manager.send_command 'MOVE'
    manager.send_command 'REPORT'

    assert_same '0,1,NORTH', manager.report
  end

  test 'valid movement 2' do
    manager = RobotManager.new(self.class.table)

    manager.send_command 'PLACE 0,0,NORTH'
    manager.send_command 'LEFT'

    assert_same '0,0,WEST', manager.report
  end

  test 'valid movement 3' do
    manager = RobotManager.new(self.class.table)

    manager.send_command 'PLACE 1,2,EAST'
    manager.send_command 'MOVE'
    manager.send_command 'MOVE'
    manager.send_command 'LEFT'
    manager.send_command 'MOVE'

    assert_same '3,3,NORTH', manager.report
  end
end
