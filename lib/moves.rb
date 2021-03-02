require_relative 'board'
require_relative 'pieces'

# TODO
# Add valid moves to each position
# Create unique identifiers for pawns
# Work out the best method to move pieces from one position to another
class ValidMoves < Chessboard
  include Pieces

  def current_row(piece)
    @rows.each_with_index do |row, idx|
      return idx if row.include?(piece)
    end
  end

  def current_column(piece)
    @columns.each_with_index do |column, idx|
      return idx if column.include?(piece)
    end
  end

  def king(color)
    if color == black
      current_column(BLACK_KING)
      current_row(BLACK_KING)
    else
      current_column(WHITE_KING)
      current_row(WHITE_KING)
    end
  end

  def queen(color)
    if color == black
      current_column(BLACK_QUEEN)
      current_row(BLACK_QUEEN)
    else
      current_column(WHITE_QUEEN)
      current_row(WHITE_QUEEN)
    end
  end

  def rook(color)
    if color == black
      current_column(BLACK_ROOK)
      current_row(BLACK_ROOK)
    else
      current_column(WHITE_ROOK)
      current_row(WHITE_ROOK)
    end
  end

  def bishop(color)
    if color == black
      current_column(BLACK_BISHOP)
      current_row(BLACK_BISHOP)
    else
      current_column(WHITE_BISHOP)
      current_row(WHITE_BISHOP)
    end
  end

  def knight(color)
    if color == black
      current_column(BLACK_KNIGHT)
      current_row(BLACK_KNIGHT)
    else
      current_column(WHITE_KNIGHT)
      current_row(WHITE_KNIGHT)
    end
  end

  def pawn(color, identifier) 
    if color == black
      current_column(BLACK_PAWN)
      current_row(BLACK_PAWN)
    else
      current_column(WHITE_PAWN)
      current_row(WHITE_PAWN)
    end
  end
end
