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
end