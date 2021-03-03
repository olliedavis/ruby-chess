require_relative 'board'
require_relative 'pieces'

# TODO
# Add valid moves to each position
# Create unique identifiers for pawns
# Work out the best method to move pieces from one position to another
class ValidMoves < Chessboard
  include Pieces

  def position_to_index(position_string)
    positions = %w[a b c d e f g h]
    column = positions.downcase.index(position_string[0])
    row = position_string[1].to_i
    [(8 - row), column]
  end

  def king(color, position)
    position_idx = position_to_index(position)
    valid_moves = position_idx[[-1, -1], [-1, 0], [-1, 1],[0, -1],[0, 1], [1, -1], [1, 0], [1, 1]]
  end

  def queen(color)
  end

  def rook(color)
  end

  def bishop(color)

  end

  def knight(color)
  end

  def pawn(color, identifier) 
  end
end
