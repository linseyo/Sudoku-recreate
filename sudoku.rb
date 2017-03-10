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
