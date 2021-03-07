require_relative '../lib/chess'

describe Chess do
  subject(:chess) { described_class.new }

  describe '#valid_input?' do
    context 'when a valid input is provided' do
      it 'returns true' do
        expect(chess.valid_input?('7B')).to be true
      end
    end
    context 'when an invalid input is provided' do
      it 'returns false' do
        expect(chess.valid_input?('72')).to be false
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
      it 'returns true' do
        expect(chess.legal_move?('♙', [1, 1], [2, 1], 'black')).to be true
        expect(chess.legal_move?('♟', [6, 1], [5, 1], 'white')).to be true
        expect(chess.legal_move?('♙', [1, 1], [3, 1], 'black')).to be true
        expect(chess.legal_move?('♟', [6, 1], [4, 1], 'white')).to be true
      end
    end
    context "when a provided position is within the piece's moveset" do
      it 'returns true' do
        expect(chess.legal_move?('♔', [0, 3], [0, 4])).to be true
        expect(chess.legal_move?('♕', [5, 5], [2, 5])).to be true
        expect(chess.legal_move?('♗', [4, 0], [5, 1])).to be true
        expect(chess.legal_move?('♖', [0, 0], [4, 0])).to be true
        expect(chess.legal_move?('♘', [6, 1], [4, 0])).to be true
      end
    end
  end
end

