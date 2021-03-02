require_relative 'board'
require_relative 'pieces'

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
end

