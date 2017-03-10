require_relative '../sudoku'

describe "Sudoku" do
let(:new_game) { "1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--" }
let(:matching_game)  { ["1", "-", "5", "8", "-", "2", "-", "-", "-"]
                        ["-", "9", "-", "-", "7", "6", "4", "-", "5"]
                        ["2", "-", "-", "4", "-", "-", "8", "1", "9"]
                        ["-", "1", "9", "-", "-", "7", "3", "-", "6"]
                        ["7", "6", "2", "-", "8", "3", "-", "9", "-"]
                        ["-", "-", "-", "-", "6", "1", "-", "5", "-"]
                        ["-", "-", "7", "6", "-", "-", "-", "3", "-"]
                        ["4", "3", "-", "-", "2", "-", "5", "-", "1"]
                        ["6", "-", "-", "3", "-", "8", "9", "-", "-"]
                      }

  context 'when given a string of a length of 3' do
    it 'returns request' do
      expect(solve("1-2")).to eq "📝 Need more information!!!"
    end
  end

  context 'when given a string of numbers and dashes' do
    it 'creates a sudoku board' do
      expect(solve(new_game)).to match_array(matching_game)
    end
  end
end

