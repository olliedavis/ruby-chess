require_relative 'board'
Dir['../lib/pieces/*.rb'].sort.each { |file| require file }
class Chess
  def initialize
    @chessboard = Chessboard.new.board
    @pieces = %w[king queen rook bishop knight pawn]
    @king = King.new
    @queen = Queen.new
    @bishop = Bishop.new
    @rook = Rook.new
    @knight = Knight.new
    @pawn = Pawn.new
  end

  def move_validator(piece, input, current_position_index, new_position_index)
    valid_piece?(piece)
    valid_position?(input)
    legal_move?(piece, current_position_index, new_position_index)
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

  def legal_move?(piece, current_position_index, new_position_index)
    current_piece = piece_to_class(piece)
    current_piece.moves.each do |x, y|
      return true if new_position_index == [(current_position_index[0] + x), (current_position_index[1] + y)]
    end
  end

  def piece_to_class(piece)
    case piece
    when 'king'
      @king
    when 'queen'
      @queen
    when 'bishop'
      @bishop
    when 'rook'
      @rook
    when 'knight'
      @knight
    when 'pawn'
      @pawn
    end
  end

  def current_player(play_counter)
    return 'white' if play_counter.even?
    return 'black' if play_counter.odd?
  end
end
