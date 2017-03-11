# Takes a board as a string in the format
# you see in the puzzle file. Returns
# something representing a board after
# your solver has tried to solve it.
# How you represent your board is up to you!
def solve(board_string)
  game_board = populate_board(board_string)
  range = (0..8)
  count = 0
  loop do
    old_board = game_board
    check = true
    used_guess = false
    break if used_guess
    range.each do |y|
      range.each do |x|
        narrow_possibilities(game_board, y, x)
      end
      if game_board[y].any? {|cell| cell.length > 1}
          check = false
      else
        nil
      end
    end
    new_board = game_board
    if old_board == new_board
      range.each do |guess_y|
        row_loop_count = 0
        range.each do |guess_x|
          break if guess_possibilities(game_board, guess_y, guess_x)
          row_loop_count += 1
        end
        break if row_loop_count < 9
      end
      used_guess = true
    end
    break if check == true
    count += 1
    break if count > 5
  end
  game_board
end

# Returns a boolean indicating whether
# or not the provided board is solved.
# The input board will be in whatever
# form `solve` returns.
def solved?(game_board)
  range = (0..8)
  check = true
  range.each do |y|
    range.each do |x|
      narrow_possibilities(game_board, y, x)
    end
    if game_board[y].any? {|cell| cell.length > 1}
        check = false
    else
      nil
    end
  end
  check
end

# Takes in a board in some form and
# returns a _String_ that's well formatted
# for output to the screen. No `puts` here!
# The input board will be in whatever
# form `solve` returns.
def pretty_board(board)
  pretty_board = ""
  board.each_with_index do |row, index|
    # Add line break between boxes
    pretty_board << add_line(["┌", "┬", "┬", "┐"]) if index == 0
    pretty_board << add_line(["├", "┼", "┼", "┤"]) if index == 3 || index == 6
    row.each_with_index do |cell, index|
      pretty_board << "| " if index  % 3 == 0 # Add line break between boxes
      pretty_board << (cell.length == 1 ? cell + " " : "  ")
    end
    pretty_board << "| \n"
  end
  pretty_board << add_line(["└", "┴", "┴", "┘"])
end

def add_line(symbols)
  line_break = "-" * 7
  symbols.join(line_break) + "\n"
end

# Takes in a string (81 characters) with dashes and numbers and converts into a 9 x 9 game board
# Empty cells are filled are filled with possibilities
def populate_board(input)
  game_board = []
  input_index = 0
  9.times do
    # Populate board with rows
    game_board_row = []
    9.times do
      # Populate rows with numbers
      character = input[input_index]
      game_board_row << (character == "-" ? "123456789" : character)
      input_index += 1
    end
    game_board << game_board_row
  end
  game_board
end

# Narrows possibilities of a cell by checking horizontal, vertical,
      # and box values
def narrow_possibilities(game_board, origin_y, origin_x)
  check_row(game_board, origin_y, origin_x)
  flipped_game_board = flip_game_board(game_board)
  # Flip origin x and y in parameters because game_board is flipped
  check_row(flipped_game_board, origin_x, origin_y)
  # Check relevant box for numbers already there
  check_box(game_board, origin_y, origin_x)
end

def guess_possibilities(game_board, origin_y, origin_x)
  return guess_row(game_board, origin_y, origin_x)
  flipped_game_board = flip_game_board(game_board)
  # Flip origin x and y in parameters because game_board is flipped
  return guess_row(flipped_game_board, origin_x, origin_y)
  # Check relevant box for numbers already there
  return guess_box(game_board, origin_y, origin_x)
end

# Deletes possibilities from cell if a number is in the same row
      # by checking vertical and horizontal
def check_row(game_board, origin_y, origin_x )
  # Origin x and y correspond to cell that we are searching from
  # Cycling through each cell in given row
  game_board[origin_y].each_index do |x|
    # If cell has one possibility...
    if x == origin_x

    elsif game_board[origin_y][x].length == 1
      # Delete this possibility from origin
      game_board[origin_y][origin_x].delete!(game_board[origin_y][x])
    end
  end
end

def guess_row(game_board, origin_y, origin_x )
  # Origin x and y correspond to cell that we are searching from
  # Cycling through each cell in given row
  game_board[origin_y].each_index do |x|
    # If cell has one possibility...
    if x == origin_x

    elsif game_board[origin_y][x] == game_board[origin_y][origin_x]
      if game_board[origin_y][origin_x].length == 2 && game_board[origin_y][x] == 2
        # Delete this possibility from origin
        game_board[origin_y][origin_x].delete!(game_board[origin_y][x][0])
        return true
      end
    end
  end
end

# Flips the game_board so rows are now columns...used to check columns.
def flip_game_board(game_board)
  game_board.transpose
end

# Deletes possibilities from cell if a number is in the same row
      # by checking box(3x3)
def check_box(game_board, origin_y, origin_x)
  # If origin-y and origin-x meet a certain condition...
        # Iterate through a specific box

  if (0..2).include?(origin_y) && (0..2).include?(origin_x)
    loop_box(game_board, origin_y, origin_x, (0..2), (0..2))
  elsif (0..2).include?(origin_y) && (3..5).include?(origin_x)
    loop_box(game_board, origin_y, origin_x, (0..2), (3..5))
  elsif (0..2).include?(origin_y) && (6..8).include?(origin_x)
    loop_box(game_board, origin_y, origin_x, (0..2), (6..8))
  elsif (3..5).include?(origin_y) && (0..2).include?(origin_x)
    loop_box(game_board, origin_y, origin_x, (3..5), (0..2))
  elsif (3..5).include?(origin_y) && (3..5).include?(origin_x)
    loop_box(game_board, origin_y, origin_x, (3..5), (3..5))
  elsif (3..5).include?(origin_y) && (6..8).include?(origin_x)
    loop_box(game_board, origin_y, origin_x, (3..5), (6..8))
  elsif (6..8).include?(origin_y) && (0..2).include?(origin_x)
    loop_box(game_board, origin_y, origin_x, (6..8), (0..2))
  elsif (6..8).include?(origin_y) && (3..5).include?(origin_x)
    loop_box(game_board, origin_y, origin_x, (6..8), (3..5))
  elsif (6..8).include?(origin_y) && (6..8).include?(origin_x)
    loop_box(game_board, origin_y, origin_x, (6..8), (6..8))
  end
end

def guess_box(game_board, origin_y, origin_x)
  # If origin-y and origin-x meet a certain condition...
        # Iterate through a specific box

  if (0..2).include?(origin_y) && (0..2).include?(origin_x)
    return loop_guess_box(game_board, origin_y, origin_x, (0..2), (0..2))
  elsif (0..2).include?(origin_y) && (3..5).include?(origin_x)
    return loop_guess_box(game_board, origin_y, origin_x, (0..2), (3..5))
  elsif (0..2).include?(origin_y) && (6..8).include?(origin_x)
    return loop_guess_box(game_board, origin_y, origin_x, (0..2), (6..8))
  elsif (3..5).include?(origin_y) && (0..2).include?(origin_x)
    return loop_guess_box(game_board, origin_y, origin_x, (3..5), (0..2))
  elsif (3..5).include?(origin_y) && (3..5).include?(origin_x)
    return loop_guess_box(game_board, origin_y, origin_x, (3..5), (3..5))
  elsif (3..5).include?(origin_y) && (6..8).include?(origin_x)
    return loop_guess_box(game_board, origin_y, origin_x, (3..5), (6..8))
  elsif (6..8).include?(origin_y) && (0..2).include?(origin_x)
    return loop_guess_box(game_board, origin_y, origin_x, (6..8), (0..2))
  elsif (6..8).include?(origin_y) && (3..5).include?(origin_x)
    return loop_guess_box(game_board, origin_y, origin_x, (6..8), (3..5))
  elsif (6..8).include?(origin_y) && (6..8).include?(origin_x)
    return loop_guess_box(game_board, origin_y, origin_x, (6..8), (6..8))
  end
end

# Loops through each cell in box and removes possibility
def loop_box(game_board, origin_y, origin_x, range_y, range_x)
  range_y.each do |y|
    range_x.each do |x|
      if y == origin_y && x == origin_x

      elsif game_board[y][x].length == 1
        # Delete this possibility from origin
        game_board[origin_y][origin_x].delete!(game_board[y][x])
      end
    end
  end
end

def loop_guess_box(game_board, origin_y, origin_x, range_y, range_x)
  range_y.each do |y|
    range_x.each do |x|
      if y == origin_y && x == origin_x

      elsif game_board[origin_y][x] == game_board[origin_y][origin_x]
        if game_board[origin_y][origin_x].length == 2
          # Delete this possibility from origin
          game_board[origin_y][origin_x].delete!(game_board[origin_y][x][0])
          return true
        end
      end
    end
  end
end


