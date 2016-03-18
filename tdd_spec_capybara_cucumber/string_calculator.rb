require 'minitest/autorun'

class Calculator
  attr_reader :digits

  def initialize(digits_string)
    @digits = parse_digits(digits_string)
  end
  
  def sum
    digits.reduce(:+)
  end

  def product
    digits.reduce(:*)
  end

  private

  def parse_digits(str)
    str.split(',').map { |n| n.to_i } 
  end

end

describe Calculator do

  it 'sums provided digits' do
    calc = Calculator.new('1,2,3,4,5')
    calc.sum.must_equal(15)
  end

  it 'multiplies provided digits' do
    calc = Calculator.new('1,2,3,4,5')
    calc.product.must_equal(120)
  end

end
