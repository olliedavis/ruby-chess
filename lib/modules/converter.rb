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
    index_to_piece(index)
  end

  def piece_to_class(piece, first_index, second_index =[])
    case piece
    when '♔', '♚'
      @king = King.new(first_index, @board)
    when '♘', '♞'
      @knight = Knight.new(first_index, @board)
    when '♕', '♛'
      @queen = Queen.new(first_index, @board)
    when '♗', '♝'
      @bishop = Bishop.new(first_index, @board)
    when '♖', '♜'
      @rook = Rook.new(first_index, @board)
    when '♙', '♟'
      @pawn = Pawn.new(piece, first_index, @board, second_index)
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
      piece_to_class(piece, first_index)
    end
  end

  def promotion_choice_to_piece(pawn, choice_int)
    return @black_pieces[choice_int] if pawn == '♙'
    return @white_pieces[choice_int] if pawn == '♟'
  end

  def index_to_piece(index)
    @chessboard.board[index[0]][index[1]]
  end

  def moves_to_index(original_pos, all_moves)
    indexed_arr = []
    all_moves.each do |x, y|
      indexed_arr << [(original_pos[0] + x), (original_pos[1] + y)]
    end
    indexed_arr
  end
end
