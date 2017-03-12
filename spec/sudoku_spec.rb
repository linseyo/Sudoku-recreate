require_relative '../sudoku'

describe "Sudoku" do

  let (:board_string){board_string = File.readlines('sudoku_puzzles.txt').first.chomp}

  context 'Compares each cell item in a row to the origin cell and removes possibilities' do
    it 'Checks the row for singular value cells' do
      test_board = [["5", "6", "123456789", "1234567", "12"], []]
      check_row(test_board, 0, 2)
      expect(test_board[0][2]).to eq "1234789"
    end

    it 'Flips board (switching row and cols)' do
      test_board = [["1", "2", "3"], ["4", "5", "6"]]
      expect(flip_game_board(test_board)).to eq [["1", "4"], ["2", "5"], ["3", "6"]]
    end

     it 'Narrows possibilities from cells within same box' do
      # test_board has specific numbers for specific test
      test_board = [["1237", "235689", "3", "234234", "234", "324523", "234234", "23", "1"], ["1", "235689", "5", "234234", "234", "324523", "234234", "23", "1"], ["8", "6", "3", "234234", "234", "324523", "234234", "23", "1"], ["1237", "235689", "3", "234234", "234", "324523", "234234", "23", "1"], ["1237", "235689", "3", "234234", "234", "324523", "234234", "23", "1"], ["1237", "235689", "3", "234234", "234", "324523", "234234", "23", "1"], ["1237", "235689", "3", "234234", "234", "324523", "234234", "23", "1"], ["1237", "235689", "3", "234234", "234", "324523", "234234", "23", "1"], ["1237", "235689", "3", "234234", "234", "324523", "234234", "23", "1"]]
      check_box(test_board, 1, 1)
      expect(test_board[1][1]).to eq "29"
    end

    it 'Narrows down all possibilities, checking row, col, and box' do
      # test_board has specific numbers for specific test
      test_board = [["1237", "235689", "3", "234234", "234", "324523", "234234", "23", "1"], ["1", "235689", "5", "234234", "234", "324523", "234234", "23", "1"], ["8", "6", "3", "234234", "234", "324523", "234234", "23", "1"], ["1237", "3", "3", "234234", "234", "324523", "234234", "23", "1"], ["1237", "9", "3", "234234", "234", "324523", "234234", "23", "1"], ["1237", "235689", "3", "234234", "234", "324523", "234234", "23", "1"], ["1237", "235689", "3", "234234", "234", "324523", "234234", "23", "1"], ["1237", "235689", "3", "234234", "234", "324523", "234234", "23", "1"], ["1237", "235689", "3", "234234", "234", "324523", "234234", "23", "1"]]
      narrow_possibilities(test_board, 1, 1)
      expect(test_board[1][1]).to eq "2"
    end

    it 'Narrows down all possibilities using populated board' do
      # test_board has specific numbers for specific test
      test_board = populate_board(board_string)
      narrow_possibilities(test_board, 4, 6)
      expect(test_board[4][6]).to eq "1"
    end

    it 'Narrows down all possibilities & solves for answer using populated board' do
      # test_board has specific numbers for specific test
      test_board = populate_board("29-5----77-----4----4738-129-2--3-648---5--7-5---672--3-9--4--5----8-7---87--51-9")
      total_lengths = 0
      range = (0..8)
      range.each do |y|
        range.each do |x|
          total_lengths += test_board[y][x].length
        end
      end

      40.times do
        for y in 0..8
          for x in 0..8
            narrow_possibilities(test_board, y, x)
          end
        end
      end

      total_lengths = 0
      range = (0..8)
      range.each do |y|
        range.each do |x|
          total_lengths += test_board[y][x].length
        end
      end
      expect(total_lengths).to eq 81
    end
  end   
  
# TESTS POPULATE BOARD
  
  context 'when creates and populates the game board' do
  
    let(:game_string) { "1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--" }

    it "when dash, puts string with all possibilities in cell - 1st row" do
      expect(populate_board(game_string)[0][4]).to eq('123456789')
    end

    it "when # given, puts string with that # in cell - 1st row" do
      expect(populate_board(game_string)[0][2]).to eq('5')
    end

    it "when dash, puts string with all possibilities in cell - last row" do
      expect(populate_board(game_string)[8][2]).to eq('123456789')
    end

    it "when # given, puts string with that # in cell - last row" do
      expect(populate_board(game_string)[8][3]).to eq('3')
    end

    it "puts correct value in cell" do
      string_index = 0
      for row_index in 0..8
        for col_index in 0..8
          if game_string[string_index] == '-'
            expect(populate_board(game_string)[row_index][col_index]).to eq('123456789')
          else
            expect(populate_board(game_string)[row_index][col_index]).to eq(game_string[string_index])
          end
          string_index += 1
        end
      end
    end
  end
end
