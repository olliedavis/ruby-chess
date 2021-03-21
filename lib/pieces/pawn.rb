class Pawn
  attr_reader :moves

  def initialize(piece, first_index, second_index, board)
    @black_pieces = ['♖', '♘', '♗', '♕', '♔', '♙']
    @white_pieces = ['♜', '♞', '♝', '♚', '♛', '♟']
    @moves = move_check(piece, first_index, second_index, board)
  end

  def move_check(piece, first_index, second_index, board)
    if first_index[1] != second_index[1] && legal_diagonal?(piece, second_index, board)
      return [[-1, -1], [-1, 1]] if piece == '♟'
      return [[1, 1], [1, -1]] if piece == '♙'

    elsif first_index[0] == 1 || first_index[0] == 6
      return [[-1, 0], [-2, 0]] if piece == '♟'
      return [[1, 0], [2, 0]] if piece == '♙'
    else
      return [[-1, 0]] if piece == '♟'
      return [[1, 0]] if piece == '♙'
    end
  end

  def legal_diagonal?(piece, second_index, board)
    if piece == '♟' && @black_pieces.any? { |black_piece| black_piece == board[second_index[0]][second_index[1]] }
      true
    elsif piece == '♙' && @white_pieces.any? { |white_piece| white_piece == board[second_index[0]][second_index[1]] }
      true
    else
      false
    end
  end

  def promotion?(piece, second_index)
    if piece == '♟' && second_index[0].zero?
      true
    elsif piece == '♙' && second_index[0] == 7
      true
    else
      false
    end
  end


end
