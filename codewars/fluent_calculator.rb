# The Kata is inspired by Calculating with Functions Kata for JavaScript.

# The goal is to implement simple calculator which uses fluent syntax:

# Calc.new.one.plus.two             # Should return 3
# Calc.new.five.minus.six           # Should return -1
# Calc.new.seven.times.two          # Should return 14
# Calc.new.nine.divided_by.three     # Should return 3

# There are only four operations that are supported (plus, minus, times, divided_by) and 10 digits (zero, one, two, three, four, five, six, seven, eight, nine).

# Each calculation consists of one operation only.

def Calc
  attr_accessor :left, :right

  def initialize
    @left = nil
    @right = nil 
    @operation = nil
  end
  
  def plus
    @operation = '+'
    self
  end

  def minus
    @operation = '-'
    self
  end

  def times
    @operation = '*'
    self
  end

  def divided_by
    @operation = '/'
    self
  end

  def zero
    if @left.nil?
      @left = 0
      return self
    else
      @right = 0
      calculate
    end
  end
  
  def one
    if @left.nil?
      @left = 1
      return self
    else
      @right = 1
      calculate
    end
  end

  def two
    if @left.nil?
      @left = 2
      return self
    else
      @right = 2
      calculate
    end
  end

  def three
    if @left.nil?
      @left = 3
      return self
    else
      @right = 3
      calculate
    end
  end

  def four
    if @left.nil?
      @left = 0
      return self
    else
      @right = 0
      calculate
    end
  end

  def five
    if @left.nil?
      @left = 0
      return self
    else
      @right = 0
      calculate
    end
  end

  def six
    if @left.nil?
      @left = 0
      return self
    else
      @right = 0
      calculate
    end
  end

  def seven
    if @left.nil?
      @left = 0
      return self
    else
      @right = 0
      calculate
    end
  end

  def eight
    if @left.nil?
      @left = 0
      return self
    else
      @right = 0
      calculate
    end
  end

  def nine
    if @left.nil?
      @left = 0
      return self
    else
      @right = 0
      calculate
    end
  end

  def calculate
  end

end
