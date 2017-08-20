class RobotController

  attr_accessor :robot

  def initialize(robot)
    @robot = robot
  end

  # parses user input and issues the appropriate commands to the robot
  def execute(command)
    if command =~ /^PLACE\s+\d+\s*,\s*\d+\s*,\s*(NORTH|SOUTH|EAST|WEST)$/
      command, x, y, direction = command.gsub(',', ' ').split
      @robot.place(Position.new(x.to_i, y.to_i, direction))

    elsif command =~ /^MOVE$/
      @robot.move
    elsif command =~ /^LEFT$/
      @robot&.turn_left if @robot.placed?
    elsif command =~ /^RIGHT$/
      @robot&.turn_right if @robot.placed?
    elsif command =~ /^REPORT$/
      puts @robot.report
    end
  end

end
