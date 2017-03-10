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


def method ()
  mega_array.each_with_index do |row, rposition|
    row.each_with_index do |cell, cposition|
      if dash_finder(cell)
        check_arrays(cell, rposition, cposition)
        # then do the check on the row
        # do the column check
        # do the box check
      end
    end
  end
end

def check_arrays(cell, rposition, cposition)
array.each {|value| (1..9).each do
value == number}
end

def dash_finder(cell)
  cell.include?("-")
end

def horizontal(rposition)
  mega_array[rposition]
end

def vertical(cposition)
  mega_array.transpose[cposition]
end

def box_check(cell)

end

mega_array = [
  [1, 2, 3],
  [4, 5, 6],
  [7,8, 9]
]
mega_array[0][0] == [row1]

# pseudocode
# check horizontally, put the possible in the satchel
# check vertically, if something is not allowed from satchel, take it out
# check the box, if something not allowed from satchel, take it out
# if only 1 number is left, replace - with number
