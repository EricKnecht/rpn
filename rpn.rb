require 'pry'
class RPNCalculator

  attr_accessor :stack

  RPN_OPERATION_WHITELIST = [
    :+,
    :-,
    :*,
    :/,
    :**
  ]

  def initialize
    @stack = []
  end

  def evaluate expression
    if number? expression
      number = expression.to_f 
      stack.push number
      number 
    elsif RPN_OPERATION_WHITELIST.include? expression.to_sym
      raise "Not enough operands" if stack.size < 2
      second_operand = stack.pop
      first_operand  = stack.pop

      result = first_operand.send(expression.to_sym, second_operand)
      stack.push result
      result
    else
      raise "Unsupported expression #{expression}"
    end

  end


  def number? string
    true if Float(string) rescue false
  end


end