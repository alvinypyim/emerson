# Manage the robot and the table
class RobotManager
  attr_accessor :table, :robot

  def initialize(table)
    @table = table
  end

  # Process commands using the command parser
  def send_command(command)
    command = CommandParser.parse(command)
    return unless command

    if command.is_a? PlaceCommand
      return unless table.contain? command.location

      unless robot
        self.robot = Robot.new table, command.direction
        table.place command.location, robot
        return
      end

      table.place table.find(robot), nil
      robot.direction = command.direction
      table.place command.location, robot
      return
    end

    return unless robot

    return report if command == :report

    robot.move if command == :move
    robot.rotate Direction::LEFT if command == :left
    robot.rotate Direction::RIGHT if command == :right
    nil
  end

  def report
    return unless robot
    location = table.find(robot)
    "#{location.x},#{location.y},#{robot.direction.to_s.upcase}"
  end
end
