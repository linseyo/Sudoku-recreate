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
def define_box_coords(row_index, col_index)
  ref_row_index = (define_ref_index(row_index))
  ref_col_index = (define_ref_index(col_index))
  box_coords = []
  3.times do |row_adjust|
    row_coord = ref_row_index + row_adjust
    3.times do |col_adjust|
      cell_coord = []
      col_coord = ref_col_index + col_adjust
      cell_coord << row_coord << col_coord
      box_coords << cell_coord
    end
  end
  box_coords
end

# ref_index refers index of top left cell in box
def define_ref_index(input_index)
  ref_index = ( input_index / 3) * 3
end

def update_board(coordinate_array, board)
  coordinate_array.each do |coord|
    test_value = board[coord[0]][coord[1]]
    if cell_solved?(test_value)
      found_value = test_value
      eliminate_poss_value(coordinate_array, board, found_value)
    end
  end
  board
end
def eliminate_poss_value(coordinate_array, board, found_value)
  coordinate_array.each do |coord|
    test_value = board[coord[0]][coord[1]]
    if !cell_solved?(test_value)
      test_value.gsub!(/#{Regexp.quote(found_value)}/, "")
    end
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
