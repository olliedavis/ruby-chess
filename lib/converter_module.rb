module Converter
  #  converts the letter's position to integer position. EG, B3 = [5, 1]
  def input_to_index(input)
    x_axis = %w[A B C D E F G H]
    column = x_axis.index(input[0]) # returns the index of the first value of input
    row = input[1].to_i
    [(8 - row), column]
  end

  def input_to_piece(input)
    index = input_to_index(input)
    @chessboard.board[index[0]][index[1]]
  end

  def piece_to_class(piece, first_index = [], second_index = [])
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
      @pawn = Pawn.new(piece, first_index, second_index, @chessboard.board)
    end
  end

  def input_to_class(first_input, second_input)
    # this needs to check for Pawn as Pawn have different moves sets if they have not moved
    piece = input_to_piece(first_input)
    first_index = input_to_index(first_input)
    second_index = input_to_index(second_input)
    if ['♟', '♙'].include?(piece)
      piece_to_class(piece, first_index, second_index)
    else
      piece_to_class(piece)
    end
  end

  def promotion_choice_to_piece(pawn, choice)
    return @black_pieces[choice - 1] if pawn == '♙'
    return @white_pieces[choice - 1] if pawn == '♟'
  end
end
