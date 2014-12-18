require 'test_helper'
 
class RobotManagerTest < ActiveSupport::TestCase
  test 'valid movement 1' do
    manager = RobotManager.new

    manager.send_command 'PLACE 0,0,NORTH'
    manager.send_command 'MOVE'
    manager.send_command 'REPORT'

    assert_same manager.report, '0,1,NORTH'
  end

  test 'valid movement 2' do
    manager = RobotManager.new

    manager.send_command 'PLACE 0,0,NORTH'
    manager.send_command 'LEFT'

    assert_same manager.report, '0,0,WEST'
  end

  test 'valid movement 3' do
    manager = RobotManager.new

    manager.send_command 'PLACE 1,2,EAST'
    manager.send_command 'MOVE'
    manager.send_command 'MOVE'
    manager.send_command 'LEFT'
    manager.send_command 'MOVE'

    assert_same manager.report, '3,3,NORTH'
  end
end
