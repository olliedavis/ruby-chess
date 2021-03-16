require_relative '../lib/board'

describe Chessboard do
  subject(:board) { Chessboard.new }

  describe '#current_board' do
    context 'when called' do
      xit 'returns the current board' do
        # TODO
      end
    end
  end
  
  describe '#pieces_left_count' do
    context 'when called' do
      xit 'returns number of pieces left' do
        expect(board.pieces_left_count).to eq(32)
      end
    end
  end

  describe '#input_to_index' do
    context 'when given a position' do
      it 'returns the matching index in relation to the board' do
        expect(board.input_to_index('B3')).to eq([5, 1])
        expect(board.input_to_index('A1')).to eq([7, 0])
        expect(board.input_to_index('E5')).to eq([3, 4])
      end
    end
  end
end