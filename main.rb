require_relative 'lib/table'
require_relative 'lib/robot'
require_relative 'lib/position'
require_relative 'lib/robot_controller'


table = Table.new(5, 5)
robot = Robot.new(table)
controller = RobotController.new(robot)


puts "Welcome :)"




loop do
  puts "input command (EXIT to quit): "

  input = gets

  controller.execute(input)

  break if input =~ /exit/i
end
