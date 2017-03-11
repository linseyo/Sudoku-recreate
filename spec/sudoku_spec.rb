require_relative '../sudoku'

describe "Sudoku" do
  let (:board) {"1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--"}
  let (:board2) {"897465321897465321897465321897465321897465321897465321897465321897465321897465321"}

  context 'sudoku game has ended' do
    it 'returns false when board contains non-integer numbers' do
      expect(solved?(board)).to eq false
    end
  end
    it 'returns true when board contains only integers' do
      expect(solved?(board2)).to eq true
    end



end
