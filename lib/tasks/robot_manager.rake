namespace :robot_manager do
  desc 'Robot manager to process commands and send them to the robot'
  task start: :environment do
    manager = RobotManager.new(Table.new(Rectangle.new(5, 5)))

    puts 'Enter end-of-file (^d) to quit:'

    while command = STDIN.gets
      result = manager.send_command(command)
      puts result  if result
    end
  end
end
