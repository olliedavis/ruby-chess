require_relative '../lib/chess'

describe Chess do
  subject(:chess) { described_class.new }

  describe '#valid_input?' do
    context 'when a valid input is provided' do
      it 'returns true' do
        expect(chess.valid_input?('B7')).to be true
        expect(chess.valid_input?('C1')).to be true
      end
    end
    context 'when an invalid input is provided, ' do
      it 'returns false' do
        expect(chess.valid_input?('72')).to be false
        expect(chess.valid_input?('Foo')).to be false
        expect(chess.valid_input?('1A')).to be false
      end
    end
  end

  describe '#valid_piece?' do
    context 'when a valid white piece is selected' do
      it 'returns true' do
        expect(chess.valid_piece?('A1')).to be true
      end
    end
    context 'when white selects a black piece' do
      it 'returns false' do
        expect(chess.valid_piece?('C8')).to be false
      end
    end
    context 'when a valid black piece is selected' do
      it 'returns true' do
        chess.instance_variable_set(:@turn_counter, 1)
        expect(chess.valid_piece?('D7')).to be true
      end
    end
    context 'when black selects a white piece' do
      it 'returns false' do
        chess.instance_variable_set(:@turn_counter, 1)
        expect(chess.valid_piece?('E1')).to be false
      end
    end
  end 

  describe '#legal_move?' do
    context "when a provided position is within the Pawn's moveset" do
      xit 'returns true' do
        expect(chess.legal_move?([1, 1], [2, 1])).to be true # white
        expect(chess.legal_move?([6, 1], [5, 1])).to be true # black
        expect(chess.legal_move?([1, 1], [3, 1])).to be true # white
        expect(chess.legal_move?([6, 1], [4, 1])).to be true # black
      end
    end
    context "when a provided position is within the piece's moveset" do
      xit 'returns true' do
        expect(chess.legal_move?([0, 4], [1, 4])).to be true # king
        expect(chess.legal_move?([0, 3], [2, 5])).to be true # queen
        expect(chess.legal_move?([0, 2], [3, 5])).to be true # bishop
        expect(chess.legal_move?([0, 1], [2, 2])).to be true # knight
        expect(chess.legal_move?([0, 0], [0, 5])).to be true # rook
      end
    end
    context "when a provided is not within the piece's moveset" do
      xit 'returns false' do
        expect(chess.legal_move?([0, 4], [4, 3])).to be false  # king
        expect(chess.legal_move?([0, 3], [3, 1])).to be false  # queen
        expect(chess.legal_move?([0, 2], [1, 2])).to be false  # bishop
        expect(chess.legal_move?([0, 1], [1, 1])).to be false  # knight
        expect(chess.legal_move?([0, 0], [1, 1])).to be false  # rook
        expect(chess.legal_move?([1, 0], [5, 1])).to be false  # pawn
      end
    end
  end
end

