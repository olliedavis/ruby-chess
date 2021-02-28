require_relative '../lib/game'

describe Game do
  subject(:game) { described_class.new }

  describe '#valid_input?' do
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
  
end

