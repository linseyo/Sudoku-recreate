# Takes a board as a string in the format
# you see in the puzzle file. Returns
# something representing a board after
# your solver has tried to solve it.
# How you represent your board is up to you!

# INPUT: String
# OUTPUT: String

def solve(board_string)
  board_array = []
  separated_board_string = board_string.split('')
  board_array << (separated_board_string[0..8])
  board_array << (separated_board_string[9..17])
  board_array << (separated_board_string[18..26])
  board_array << (separated_board_string[27..35])
  board_array << (separated_board_string[36..44])
  board_array << (separated_board_string[45..53])
  board_array << (separated_board_string[54..62])
  board_array << (separated_board_string[63..71])
  board_array << (separated_board_string[72..80])
  board_array

#   temp_array = board_array.join
#  while board_array.include?("-")
  50.times { sudoku_solver(board_array) }
  # end
  board_array
end

# Returns a boolean indicating whether
# or not the provided board is solved.
# The input board will be in whatever
# form `solve` returns.
def solved?(board)
  if board.join.match(/\D/)
    false
  else
    true
  end
end

# Takes in a board in some form and
# returns a _String_ that's well formatted
# for output to the screen. No `puts` here!
# The input board will be in whatever
# form `solve` returns.
def pretty_board(board)
  #board.each do |num|
  #  num.each { |chars| chars}.join(" ")
    #end
  display_board = board.join("|")
  puts display_board[0..17]
  puts display_board[18..35]
  puts display_board[36..53]
  puts display_board[54..71]
  puts display_board[72..89]
  puts display_board[90..107]
  puts display_board[108..125]
  puts display_board[126..143]
  puts display_board[144..161] + "|"
end

def sudoku_solver(mega_array)
  mega_array.each_with_index do |row, rposition|
    row.each_with_index do |cell, cposition|
      if dash_finder(cell)
        # mega_array[rposition][cposition] =
        stored_value = check_arrays(mega_array, cell, rposition, cposition)
        if stored_value != "*"
          mega_array[rposition][cposition] = stored_value
        end
      end
    end
  end
  mega_array
end

def check_arrays(mega_array, cell, rposition, cposition)
numbers = ["1", "2" ,"3", "4" , "5", "6", "7", "8", "9"]
satchel = []
  numbers.each do |digit|
    if horizontal(mega_array, rposition).include?(digit) == false
      satchel << digit
    end
  end

    numbers.each do |satchel_digit|
       if vertical(mega_array, cposition).include?(satchel_digit)
        satchel.delete(satchel_digit)
      end
     end

    numbers.each do |next_digit|
     if box(mega_array, rposition, cposition).include?(next_digit)
       satchel.delete(next_digit)
     end
   end
    if satchel.length == 1
      return satchel[0]
    else
      return "*"
    end
end
# end
# array.each {|value| (1..9).each do
# value == number}

def dash_finder(cell)
  if cell == "-"
  return true
  end
end

def horizontal(mega_array, rposition)
  mega_array[rposition]
end

def vertical(mega_array, cposition)
  temparray = mega_array.transpose
  temparray[cposition]
end

def box(mega_array, rposition, cposition)
 box = []
  case rposition
  when 0..2
    case cposition
    when 0..2
      (0..2).each do |r|
        (0..2).each do |c|
          box << mega_array[r][c]
        end
      end
    when 3..5
      (0..2).each do |r|
        (3..5).each do |c|
          box << mega_array[r][c]
        end
      end
    when 6..8
      (0..2).each do |r|
        (6..8).each do |c|
          box << mega_array[r][c]
        end
      end
    end
  when 3..5
    case cposition
    when 0..2
      (3..5).each do |r|
        (0..2).each do |c|
          box << mega_array[r][c]
        end
      end
    when 3..5
      (3..5).each do |r|
        (3..5).each do |c|
          box << mega_array[r][c]
        end
      end
    when 6..8
      (3..5).each do |r|
        (6..8).each do |c|
          box << mega_array[r][c]
        end
      end
    end
  when 6..8
    case cposition
    when 0..2
      (6..8).each do |r|
        (0..2).each do |c|
          box << mega_array[r][c]
        end
      end
    when 3..5
      (6..8).each do |r|
        (3..5).each do |c|
          box << mega_array[r][c]
        end
      end
    when 6..8
      (6..8).each do |r|
        (6..8).each do |c|
          box << mega_array[r][c]
        end
      end
    end
  end
   box
end

# p box(mega_array, 3,6)

# p sudoku_solver(solve("1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--"))


# pseudocode
# check horizontally, put the possible in the satchel
# check vertically, if something is not allowed from satchel, take it out
# check the box, if something not allowed from satchel, take it out
# if only 1 number is left, replace - with number
