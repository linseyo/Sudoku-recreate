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
#






















# Narrows possibilities of a cell by checking horizontal, vertical,
      # and box values.
def narrow_possibilities(board, origin_y, origin_x)
  check_row(board, origin_y, origin_x)
  flipped_board = flip_board(board)
  # Flip origin x and y in parameters because board is flipped
  check_row(flipped_board, origin_x, origin_y)
# IN PROGRESS
end


# Deletes possibilities from cell if a number is in the same row
      # Checks vertical and horizontal
def check_row(board, origin_y, origin_x )
  # Origin x and y correspond to cell that we are searching from
  # Cycling through each cell in given row
  board[origin_y].each_index do |x|
    # If cell has one possibility...
    if board[origin_y][x].length == 1
      # Delete this possibility from origin
      board[origin_y][origin_x].delete!(board[origin_y][x])
    end
  end
end

# Flips the board so rows are now columns...used to check columns.
def flip_board(board)
  board.transpose
end

# Deletes possibilities from cell if a number is in the same row
      # Checks box(3x3)
def check_box(board, origin_y, origin_x)
end










