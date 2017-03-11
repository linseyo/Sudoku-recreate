# Takes a board as a string in the format
# you see in the puzzle file. Returns
# something representing a board after
# your solver has tried to solve it.
# How you represent your board is up to you!
def solve(board_string)
  sudoku_board = splitter(board_string)
  sudoku_board_hashes = hash_creater(sudoku_board)
  hash_filler(sudoku_board, sudoku_board_hashes)
   puts sudoku_board_hashes
  solved?(sudoku_board)
  pretty_board(board_string)
end

def hash_creater(board)
  counter = 0
  arrary_to_return = []
  9.times {
    box_name ="box #{counter}"
     box_name = {
      "0" => "-",
      "1" => "-",
      "2" => "-",
      "3" => "-",
      "4" => "-",
      "5" => "-",
      "6" => "-",
      "7" => "-",
      "8" => "-"
    }
    arrary_to_return.push(box_name)
  }
  return arrary_to_return
end

def hash_filler(game_board, hash_to_fill)
  hash_to_fill.each_with_index do |current_box, position|
    current_box = combine_case(current_box, game_board, position)
  end
end

def combine_case(box, game_board, switch)
  row_value = 0
  if switch > 5
    row_value = 6
  elsif switch > 2 && switch <= 5
    row_value = 3
  else row_value = 0
  end
  case switch
    when 0,3,6
      box["0"] = game_board[row_value][0]
      box["1"] = game_board[row_value][1]
      box["2"] = game_board[row_value ][2]
      box["3"] = game_board[(row_value +1)][0]
      box["4"] = game_board[(row_value +1)][1]
      box["5"] = game_board[(row_value +1)][2]
      box["6"] = game_board[row_value + 2][0]
      box["7"] = game_board[row_value + 2][1]
      box["8"] = game_board[row_value + 2][2]
    when 1,4,7
      box["0"] = game_board[row_value][3]
      box["1"] = game_board[row_value][4]
      box["2"] = game_board[row_value][5]
      box["3"] = game_board[row_value+1][3]
      box["4"] = game_board[row_value+1][4]
      box["5"] = game_board[row_value+1][5]
      box["6"] = game_board[(row_value+2)][3]
      box["7"] = game_board[row_value+2][4]
      box["8"] = game_board[row_value+2][5]
    when 2,5,8
      box["0"] = game_board[row_value][6]
      box["1"] = game_board[row_value][7]
      box["2"] = game_board[row_value][8]
      box["3"] = game_board[row_value +1][6]
      box["4"] = game_board[row_value +1][7]
      box["5"] = game_board[row_value +1][8]
      box["6"] = game_board[row_value + 2][6]
      box["7"] = game_board[row_value + 2][7]
      box["8"] = game_board[row_value + 2][8]
    end
end
# Returns a boolean indicating whether
# or not the provided board is solved.
# The input board will be in whatever
# form `solve` returns.
def solved?(board)
    board.each do |row|
    puts row_check(row)
  end
  board.transpose.each do |row|
    puts colum_check(row)
  end
end

def row_check(row)
  array_to_string = row.sort.map{|cell| cell}
  array_to_string = array_to_string.join
  array_to_string.include?(numbers)
end

def colum_check(row)
  row_check(row)
end

def numbers
 "123456789"
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

def splitter(board_string)
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


test = "--5-3--819-285--6-6----4-5---74-283-34976---5--83--49-15--87--2-9----6---26-495-3"
test_array = solve(test)
puts test_array


