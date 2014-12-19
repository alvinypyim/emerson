# Manage the robot and the table
class RobotManager
  attr_accessor :table, :robot

  def initialize(table)
    @table = table
  end

  def send_command(command)
  end

  def report
  end
end
