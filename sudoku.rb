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
# Empty cells are filled are filled with possibilities.
def populate_board(input)
  game_board = []
  input_index = 0
  9.times do
    # populate board with rows
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
