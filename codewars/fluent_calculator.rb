# The Kata is inspired by Calculating with Functions Kata for JavaScript.

# The goal is to implement simple calculator which uses fluent syntax:

# Calc.new.one.plus.two             # Should return 3
# Calc.new.five.minus.six           # Should return -1
# Calc.new.seven.times.two          # Should return 14
# Calc.new.nine.divided_by.three     # Should return 3

# There are only four operations that are supported (plus, minus, times, divided_by) and 10 digits (zero, one, two, three, four, five, six, seven, eight, nine).

# Each calculation consists of one operation only.

class Calc
  def initialize
    @left = nil
    @right = nil
    @operation = nil
  end

  def plus
    if @operation.nil?
      @operation = 'plus'
      return self
    else
      return @left + @right
    end
  end

  def minus
    if @operation.nil?
      @operation = 'minus'
      return self
    else
      return @left - @right
    end
  end

  def times
    if @operation.nil?
      @operation = 'times'
      return self
    else
      return @left * @right
    end
  end

  def divided_by
    if @operation.nil?
      @operation = 'divided_by'
      return self
    else
      return @left / @right
    end
  end

  def zero
    calculate(0)
  end
  
  def one
    calculate(1)
  end

  def two
    calculate(2)
  end

  def three
    calculate(3)
  end

  def four
    calculate(4)
  end

  def five
    calculate(5)
  end

  def six
    calculate(6)
  end

  def seven
    calculate(7)
  end

  def eight
    calculate(8)
  end

  def nine
    calculate(9)
  end

  def calculate(number)
    if @operation.nil?
      @left = number
      return self
    else
      @right = number
      self.send(@operation)
    end
  end
end

class Test
  def self.assert_equals(left, right)
    puts left == right ? "PASSED" : "FAILED"
  end
end

Test.assert_equals(Calc.new.four.plus.five, 9)
Test.assert_equals(Calc.new.five.plus.four, 9)


# Clever way

# class Fixnum
#   def plus;       Calc.new("+", self) end
#   def minus;      Calc.new("-", self) end
#   def times;      Calc.new("*", self) end
#   def divided_by; Calc.new("/", self) end
# end

# class Calc
#   def initialize(*arguments)
#     if arguments.length == 2
#       @operation = arguments[0]
#       @number    = arguments[1]
#     end
#   end
  
#   %w(zero one two three four five six seven eight nine).each_with_index do |w,i|
#     define_method(w) { perform i }
#   end
  
#   def perform number
#     if @operation
#       @number.send(@operation, number)
#     else
#       number
#     end
#   end
# end
