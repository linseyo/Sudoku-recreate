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
  counter = 0
  box_counter = 0
  row_counter = 0
    board.split("").each_with_index do |cell,position|
      if counter == 8
        pretty_board += " #{cell} \n"
        counter = 0
        box_counter = 0
        row_counter += 1
        next_element = board[position+1]
        if row_counter == 3 && next_element != nil
          pretty_board += "="* 36 + "\n"
          row_counter = 0
        end
      elsif box_counter == 2
        pretty_board += " #{cell} ||"
        box_counter = 0
        counter += 1
      else
        pretty_board += " #{cell} |"
        counter += 1
        box_counter +=1
      end

    end
    pretty_board
end

