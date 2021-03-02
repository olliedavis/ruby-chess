require_relative '../lib/game'

describe Game do
  subject(:game) { described_class.new }

  describe '#valid_position?' do
    context 'when a valid input is provided' do
      it 'returns true' do
        expect(game.valid_position?('7B')).to be true
      end
    end
    context 'when an invalid input is provided' do
      it 'returns false' do
        expect(game.valid_position?('72')).to be false
      end
    end
  end

  describe '#valid_piece?' do
    context 'when a valid piece is selected' do
      it 'returns true' do
        expect(game.valid_piece?('rook')).to be true
      end
    end
    context 'when a valid piece is selected' do
      it 'returns false' do
        expect(game.valid_piece?('rook7B')).to be false
      end
    end
  end

  describe '#current_player' do
    context "when it is White's turn" do
      it 'returns White' do
        expect(game.current_player(2)).to eq('white')
      end
    end

    context "when it is Black's turn" do
      it 'returns Black' do
        expect(game.current_player(5)).to eq('black')
      end
    end
  end
  
end

