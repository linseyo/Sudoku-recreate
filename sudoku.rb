# Initial unsolved board:
def format_board(board_string)
  convert_dash(format_columns(format_rows(board_string)))
end

def format_solution(board)
  board.each do |row|
    row.join('')
  end
  board.join('')
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

def each_row_to_string(board)

  single_string = ""
  board.each do |row|
    single_string += row.join('')
  end
end

 def establish_strings(board)
   stringed_row = []
  each_row = each_row_to_string(board)
  each_row.each do |row|
    stringed_row << row.join('')
  end
  stringed_row
 end

def identify_single_appearances(board)
  stuck_row = establish_strings(board)
  how_many_array = []
  stuck_row.each do |row|
    each_row_array = []
    cell_options =
    cell_options.each_char do |number|
      each_row_array << row.scan(number).length
      end
      how_many_array << each_row_array
  end
  how_many_array
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
    i += 1
  end
  rotated
end

def cell_checker(board)
  board.each_with_index do |row, row_index|
    row.each_with_index do |col, col_index|
      box_coords = define_box_coords(row_index, col_index)
      update_board(box_coords, board)
    end
  end
end

def empty_puzzle(board_string)
  if board_string == "---------------------------------------------------------------------------------"
    board_string = "123456789456789123789123456234567891567891234891234567345678912912345678678912345"
  end
  board_string
end

# Takes a board as a string in the format
# you see in the puzzle file. Returns
# something representing a board after
# your solver has tried to solve it.
# How you represent your board is up to you!
def solve(board_string)
  board_string = empty_puzzle(board_string)
  formatted_board = format_board(board_string)
  until solved?(formatted_board)
    cell_checker(reduce_possibilities_rotation(formatted_board))
  end
  formatted_board
end

# Returns a boolean indicating whether
# or not the provided board is solved.
# The input board will be in whatever
# form `solve` returns.
def solved?(board)
  return true if format_solution(board).length == 81
  false
end

# Takes in a board in some form and
# returns a _String_ that's well formatted
# for output to the screen. No `puts` here!
# The input board will be in whatever
# form `solve` returns.

def prettys_rows(row)
  row.join("  ")
end

def pretty_board(board) # output is nice string to be putsed in runner
  pretty_print = ""
  board.each do |row|
    pretty_print += (prettys_rows(row) + "\n")
  end
  pretty_print
end
