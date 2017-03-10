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


def cell_solved?(cell)
  return true if cell.length == 1
  false
end

#need to run each_with_index when this is called
#row_index=4 col_index=3
def define_coordinates(row_index, col_index)
  cell_1_row_index = (row_index / 3) * 3
  cell_1_col_index = (col_index / 3) * 3
  i = 0
  coordinate_array = []
  while i < 3
    row_coord = cell_1_row_index + i
    j = 0
    while j < 3
      coordinate = []
      col_coord = cell_1_col_index + j
      coordinate << row_coord
      coordinate << col_coord
      coordinate_array << coordinate
      j += 1
    end
    i += 1
  end
  coordinate_array
end

def update_board(coordinate_array, board)
  coordinate_array.each do |coord|
     p board[coord[0]][coord[1]]
  end
end




def solved_cells(row)
  row.each |cell|
    if cell.length == 1

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
