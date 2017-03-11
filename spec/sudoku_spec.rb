require_relative '../sudoku'

describe "Sudoku" do

  context 'Compares each cell item in a row to the origin cell and removes possibilities' do
    it 'Checks the row for singular value cells' do
      test_board = [["5", "6", "123456789", "1234567", "12"], []]
      check_row(test_board, 0, 2)
      expect(test_board[0][2]).to eq "1234789"
    end

    it 'Flips board (switching row and cols)' do
      test_board = [["1", "2", "3"], ["4", "5", "6"]]
      expect(flip_board(test_board)).to eq [["1", "4"], ["2", "5"], ["3", "6"]]
    end

    it 'Narrows possibilities horizontally and vertically' do
      test_board = [["1237", "235689", "3"], ["43", "5", "6345"], ["7", "8", "9"]]
      narrow_possibilities(test_board, 0, 1)
      expect(test_board[0][1]).to eq "269"
    end
  end






end
