# Takes a board as a string in the format
# you see in the puzzle file. Returns
# something representing a board after
# your solver has tried to solve it.
# How you represent your board is up to you!

# INPUT: String
# OUTPUT: String
def solve(board_string)
  separated_board_string = board_string.split('')
  mega_array = []
  # counter = 0
  #   while counter < 82
  #     separated_board_string.each_with_index do |number, index|
  #       index = 0
  #       mega_array << number[index]
  #       index += 1
  #       # mega_array
  #     end
  #     counter += 9
  #    p mega_array
  #   end
  mega_array << (separated_board_string[0..8])
  mega_array << (separated_board_string[9..17])
  mega_array << (separated_board_string[18..26])
  mega_array << (separated_board_string[27..35])
  mega_array << (separated_board_string[36..44])
  mega_array << (separated_board_string[45..53])
  mega_array << (separated_board_string[54..62])
  mega_array << (separated_board_string[63..71])
  mega_array << (separated_board_string[72..80])
  mega_array

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


p solve("1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--")

