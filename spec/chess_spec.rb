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
    context 'when a valid piece is selected' do
      xit 'returns true' do
        #expect(chess.valid_piece?(TODO)).to be true
      end
    end
    context 'when a valid piece is selected' do
      xit 'returns false' do
        #expect(chess.valid_piece?(TODO)).to be false
      end
    end
  end 
end

