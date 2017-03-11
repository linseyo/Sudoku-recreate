require_relative '../sudoku'

describe "Sudoku" do

 let(:game_string) { "1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--" }
  context 'when creates and populates the gameboard' do
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
  end
end
