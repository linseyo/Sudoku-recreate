def format_board(board_string)
  convert_dash(format_columns(format_rows(board_string)))
end

def format_rows(board_string)
  board_string.scan(/........./)
end

def format_columns(rows_array)
  rows_array.map do |row|
    row.split('')
  end
end

def convert_dash(board)
  board.each do |row|
    row.map do |cell|
      if cell == '-'
        possibilities = cell.gsub!(/-/, '123456789')
      end
    end
  end
end

def solved_cells(row)
  solved_cells_in_row = []
  row.each do |cell|
    if cell_solved?(cell)
      solved_cells_in_row << cell
    end
  end
  solved_cells_in_row
end

def cell_solved?(cell)
  return true if cell.length == 1
  false
end

def reduce_possibilities(row)
  already_solved = solved_cells(row)
  row.each do |cell|
    if cell_solved?(cell) == false
      already_solved.each do |num_to_remove|
        cell.gsub!(/#{Regexp.quote(num_to_remove)}/, "")
      end
      cell
    end
  end
end

def reduce_possibilities_rows(board)
  board.each do |row|
    reduce_possibilities(row)
  end
  board
end
# Takes a board as a string in the format
# you see in the puzzle file. Returns
# something representing a board after
# your solver has tried to solve it.
# How you represent your board is up to you!
def solve(board_string)
end

# Returns a boolean indicating whether
# or not the provided board is solved.
# The input board will be in whatever
# form `solve` returns.
def solved?(board)
end

# Takes in a board in some form and
# returns a _String_ that's well formatted
# for output to the screen. No `puts` here!
# The input board will be in whatever
# form `solve` returns.
def pretty_board(board)
end

# test_board = "1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--"
# reduce_possibilities_rows(format_board(test_board))
