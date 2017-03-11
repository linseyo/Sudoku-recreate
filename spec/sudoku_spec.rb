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
end
