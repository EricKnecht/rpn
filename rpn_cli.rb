#!/usr/bin/ruby
require './rpn.rb'

rpn = RPNCalculator.new

exit_commands = ['q', 'exit', 'quit']

def format_number number
  sprintf('%.2g', number)
end

while true  
  STDOUT.print '> '

  expression = STDIN.gets
  expression = expression.chomp rescue nil

  #All done here!
  if expression.nil? or exit_commands.include? expression
    puts 'Bye!'
    exit 0
  end
  begin
    result = rpn.evaluate expression
    puts format_number(result) rescue result
  rescue Exception => e
     puts e.message
  end 

end
