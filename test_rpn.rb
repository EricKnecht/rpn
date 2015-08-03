require "minitest/autorun"
require "./rpn.rb"

class TestMeme < Minitest::Test
  def setup
    @rpn = RPNCalculator.new
  end

  def test_subtract
    @rpn.evaluate '20'
    @rpn.evaluate '13'
    result = @rpn.evaluate '-'
    assert_equal result, 7
  end

  def test_add
    @rpn.evaluate '5'
    @rpn.evaluate '4'
    result = @rpn.evaluate '+'
    assert_equal result, 9
  end

  def test_multiply
    @rpn.evaluate '2.5'
    @rpn.evaluate '2'
    result = @rpn.evaluate '*'
    assert_equal result, 5
  end

  def test_divide
    @rpn.evaluate '25'
    @rpn.evaluate '5'
    result = @rpn.evaluate '/'
    assert_equal result, 5
  end

  def test_syntax
    @rpn.evaluate '7'
    exception = assert_raises(RuntimeError) { @rpn.evaluate '*' }
    assert_equal "Not enough operands", exception.message

    exception = assert_raises(RuntimeError) { @rpn.evaluate 'foo' }
    assert_equal "Unsupported expression foo", exception.message

  end
end