require_relative '../sudoku'

describe "Sudoku" do
  let (:board) {"1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--"}
  let (:board2) {"897465321897465321897465321897465321897465321897465321897465321897465321897465321"}
  let (:board_string) {"----------2-65-------18--4--9----6-4-3---57-------------------73------9----------"}

  context 'sudoku game has ended' do
    it 'returns false when board contains non-integer numbers' do
      expect(solved?(board)).to eq false
    end
    it 'returns true when board contains only integers' do
      expect(solved?(board2)).to eq true
    end
  end

  # context 'builds nested arrays'
  # it 'returns nested arrays' do
  #   expect(solve(board_string)).to be [
  #     [-,-,-,-,-,-,-,-,-],
  #     [-,2,-,6,5,-,-,-,-],
  #     [-,-,-,1,8,-,-,4,-],
  #     [-,9,-,-,-,-,6,-,4],
  #     [-,3,-,-,-,5,7,-,-],
  #     [-,-,-,-,-,-,-,-,-],
  #     [-,-,-,-,-,-,-,-,7],
  #     [3,-,-,-,-,-,-,9,-],
  #     [-,-,-,-,-,-,-,-,-]
  #   ]
  # end

end
