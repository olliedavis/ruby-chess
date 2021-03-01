require_relative '../lib/game'

describe Game do
  subject(:game) { described_class.new }

  describe '#valid_position?' do
    context 'when a valid input is provided' do
      it 'returns true' do
        expect(game.valid_input?('7B')).to be true
      end
    end
    context 'when an invalid input is provided' do
      it 'returns false' do
        expect(game.valid_input?('72')).to be false
      end
    end
  end

  describe '#valid_piece?' do
    context 'when a valid piece is selected' do
      it 'returns true' do
        expect(game.valid_piece?('Rook')).to be true
      end
    end
    context 'when a valid piece is selected' do
      it 'returns false' do
        expect(game.valid_piece?('Rook7B')).to be false
      end
    end
  end
end

