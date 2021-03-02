require_relative 'board'
class Game
  def initialize
    @board = Chessboard.new
    @pieces = %w[king queen rook bishop knight pawn]
  end

  def valid_position?(input)
    if input.length == 2
      y_axis = input[0].to_i
      x_axis = input[1]
      return true if y_axis.between?(1, 8) && x_axis.downcase.between?('a', 'h')
    end
    false
  end

  def valid_piece?(input)
    return true if @pieces.include?(input.downcase)

    false
  end
end
