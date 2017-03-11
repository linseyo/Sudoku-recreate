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

def row_cell_solved?(row)

end

# Reduce possibilities:
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

def reduce_possibilities_cols(board)
  rotated_board = board.transpose
  reduce_possibilities_rows(rotated_board)
end

def reduce_possibilities_rotation(board)
  unrotated_board = reduce_possibilities_rows(board)
  rotated = reduce_possibilities_cols(unrotated_board)
  i = 0
  while i < 100
    rotated.replace(reduce_possibilities_cols(rotated))
    p rotated
    puts
    puts
    i += 1
  end
  rotated
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

 test_board = "-8--2-----4-5--32--2-3-9-466---9---4---64-5-1134-5-7--36---4--24-723-6-----7--45-"

 solvable_board = format_board(test_board)
 p solvable_board
puts "---------------"
puts
p test_solution = reduce_possibilities_rotation(solvable_board)
 # solved_rows = reduce_possibilities_rows(solvable_board)
 # p solved_rows
 # x_and_y_solved_puzzle = reduce_possibilities_cols(solved_rows)
 # p x_and_y_solved_puzzle
