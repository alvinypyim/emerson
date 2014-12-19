require 'test_helper'
 
class CommandParserTest < ActiveSupport::TestCase
  test 'parse place command' do
    command = CommandParser.parse 'PLACE 1,2,EAST'

    assert_instance_of PlaceCommand, command
    assert_equal 1, command.location.x
    assert_equal 2, command.location.y
    assert_equal Direction::EAST, command.direction
  end

  test 'parse simple commands' do
    command = CommandParser.parse 'MOVE'
    assert_equal :move, command

    command = CommandParser.parse 'LEFT'
    assert_equal :left, command

    command = CommandParser.parse 'RIGHT'
    assert_equal :right, command

    command = CommandParser.parse 'REPORT'
    assert_equal :report, command
  end

  test 'invalid command' do
    command = CommandParser.parse 'abc'

    assert_nil command
  end
end
