module Converter
  #  converts the letter's position to integer position. EG, B3 = [5, 1]
  def input_to_index(input)
    x_axis = %w[A B C D E F G H]
    column = x_axis.index(input[0]) # returns the index of the first value of input
    row = input[1].to_i
    [(8 - row), column]
  end

  def input_to_piece(input, board)
    index = input_to_index(input)
    board[index[0]][index[1]]
  end

  def piece_to_class(piece, current_position = [])
    case piece
    when '♔', '♚'
      @king = King.new
    when '♕', '♛'
      @queen = Queen.new
    when '♗', '♝'
      @bishop = Bishop.new
    when '♖', '♜'
      @rook = Rook.new
    when '♘', '♞'
      @knight = Knight.new
    when '♙', '♟'
      @pawn = Pawn.new(current_position, piece)
    end
  end

  
end