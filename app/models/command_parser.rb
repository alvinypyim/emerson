class CommandParser
  def self.simple_commands
    [ :move, :left, :right, :report ]
  end

  # Parse string command, used by the robot manager
  def self.parse(command)
    tokens = command.split
    return if tokens.empty?

    token = tokens.first

    if tokens.length == 1
      return :move if token.casecmp('move') == 0
      return :left if token.casecmp('left') == 0
      return :right if token.casecmp('right') == 0
      return :report if token.casecmp('report') == 0
      return
    end

    return unless tokens.length == 2 and token.casecmp 'place'

    tokens = tokens[1].split(',')
    return unless tokens.length == 3
    return unless tokens[0].to_i.to_s == tokens[0] and tokens[1].to_i.to_s == tokens[1]

    direction = Direction::NORTH if tokens[2].casecmp('north') == 0
    direction = Direction::EAST if tokens[2].casecmp('east') == 0
    direction = Direction::SOUTH if tokens[2].casecmp('south') == 0
    direction = Direction::WEST if tokens[2].casecmp('west') == 0

    return unless direction

    PlaceCommand.new Coordinate.new(tokens[0].to_i, tokens[1].to_i), direction
  end
end
