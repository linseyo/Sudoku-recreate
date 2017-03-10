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

  row.each do |cell| #for each cell in the row do:
    if cell_solved?(cell) == false #if it's unsolved:
      already_solved.each do |num_to_remove|  #for 1,5,8,2 do:
        cell.gsub!(/#{Regexp.quote(num_to_remove)}/, "") #this deletes the entire cell
        p {Regexp.quote(num_to_remove)}
      end
      cell
    end
  end
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
