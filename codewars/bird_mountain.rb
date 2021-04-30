# A bird flying high above a mountain range is able to estimate the height of the highest peak.

# Can you?
# Example
# The birds-eye view

# ^^^^^^
#  ^^^^^^^^
#   ^^^^^^^
#   ^^^^^
#   ^^^^^^^^^^^
#   ^^^^^^
#   ^^^^

# The bird-brain calculations

# 111111
#  1^^^^111
#   1^^^^11
#   1^^^1
#   1^^^^111111
#   1^^^11
#   1111

# 111111
#  12222111
#   12^^211
#   12^21
#   12^^2111111
#   122211
#   1111

# 111111
#  12222111
#   1233211
#   12321
#   12332111111
#   122211
#   1111

# Height = 3

def peak_height(mountain)
  # Process mountain strings
  #     returns array of strings (numbers + spaces
  grid = Grid.new(mountain)
  return grid.process_cells
end

class Cell
  # Rules for each cell, concern neighbors (N S E W)
  #   if any neighbor is nil/empty => 1
  #   if no nil/empty neighbors, ? neighbors, and one neighbor is 1 => 2
  #   if no/nil empty, ? neighbors, and one neighbor is 2 => 3
  attr_reader :row, :column, :symbol
  attr_accessor :north, :south, :east, :west

  def initialize(row, column, symbol=' ')
    @row, @column =  row, column
    @symbol = symbol
  end

  def neighbors
    list = []
    list << north if north
    list << south if south
    list << east if east
    list << west if west
  end
end

class Grid
  def initialize(mountain)
    @mountain = mountain
    @grid = []
    @rows = mountain.length
    make_grid
  end

  def make_grid
    @mountain.each_with_index do |row, r_index|
      full_row = []
      row.chars.each_with_index do |symbol, column|
        full_row << Cell.new(r_index, column, symbol)
      end
      @grid << full_row
    end
  end

  def process_cells
    get_neighbors
    return 1 
  end

  def each_cell
    each_row do |row|
      row.each do |cell|
        yield cell if cell
      end
    end
  end

  def each_row
    @grid.each do |row|
      yield row
    end
  end

  def get_neighbors
    each_cell do |cell|
      p cell
      row, col = cell.row, cell.column

      cell.north = self[row - 1, col]
      cell.south = self[row + 1, col]
      cell.west = self[row, col - 1]
      cell.east = self[row, col + 1]
    end
    p @grid
  end

  def [](row, column)
    return nil unless row.between?(0, @rows - 1)
    return nil unless column.between?(0, @grid[row].count - 1)
    @grid[row][column]
  end
end

class Test
  def self.assert_equals(left, right)
    puts left == right ? "PASSED" : "FAILED"
  end
end


mountain = [
          "^^^^^^        ",
          " ^^^^^^^^     ",
          "  ^^^^^^^     ",
          "  ^^^^^       ",
          "  ^^^^^^^^^^^ ",
          "  ^^^^^^      ",
          "  ^^^^        "
]

Test.assert_equals(peak_height(mountain), 3)
