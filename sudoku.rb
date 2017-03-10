# Takes a board as a string in the format
# you see in the puzzle file. Returns
# something representing a board after
# your solver has tried to solve it.
# How you represent your board is up to you!
def solve(board_string)
  box = []
  if board_string.length != 81
    return "📝 Need more information!!!"
  else
    string_split_holder = board_string.split(//)
    counter = 0
    array_to_add = []
    string_split_holder.each_with_index do|cell,box_index|
      if counter == 9
        box.push(array_to_add)
        counter = 0
        array_to_add = []
        next_element = string_split_holder[box_index]
          if next_element == nil
            array_to_add.push(cell)
            box.push(array_to_add)
            break
          else
            array_to_add.push(cell)
            counter +=1
          end
      else
        array_to_add.push(cell)
        counter += 1
      end
      if box_index == 80
          box.push(array_to_add)
      end
    end
    box
  end
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

test = "1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--"
test_array = solve(test)
p test_array

