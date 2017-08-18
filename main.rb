require_relative 'lib/table'
require_relative 'lib/robot'





loop do
  puts "input command (EXIT to quit): "

  input = gets

  #command = commander.parse(input)

  #command.execute unless command.nil?

  break if input =~ /exit/i
end
