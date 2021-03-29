require_relative '../modules/converter'

class Pawn
  attr_reader :moves

  include Converter

  def initialize(piece, first_index, board)
    @black_pieces = ['♔', '♕', '♗', '♖', '♘', '♙']
    @white_pieces = ['♚', '♛', '♝', '♜', '♞', '♟']
    all_moves = move_checking(piece, first_index, board)
    @moves = moves_to_index(first_index, all_moves)
  end

  def move_checking(piece, first_index, board)
    moves = []
    # if the requested move is diagonal, and legal, return the diagonal move set
    moves.push(diagonal(piece, first_index, board))

    # if the piece has't moved, return a two position move set
    if first_index[0] == 1 || first_index[0] == 6
      moves.push(two_moves(piece))
    else
      # else return a single position move set
      moves.push(one_move(piece))
    end
    moves
  end

  def two_moves(piece)
    return [[-1, 0], [-2, 0]] if piece == '♟'
    return [[1, 0], [2, 0]] if piece == '♙'
  end

  def one_move(piece)
    return [[-1, 0]] if piece == '♟'
    return [[1, 0]] if piece == '♙'
  end
  # end of move sets

  def diagonal(piece, first_index, board)
    x_axis = first_index[0]
    y_axis = first_index[1]
    return diagonal_white(x_axis, y_axis, board) if piece == '♟'
    return diagonal_black(x_axis, y_axis, board) if piece == '♙'
  end

  def diagonal_white(x_axis, y_axis, board)
    return [[-1, -1]] if @black_pieces.any? { |b_piece| b_piece == board[x_axis - 1][y_axis - 1] }
    return [[-1, 1]] if @black_pieces.any? { |b_piece| b_piece == board[x_axis - 1][y_axis + 1] }

    []
  end

  def diagonal_black(x_axis, y_axis, board)
    return [[1, 1]] if @white_pieces.any? { |w_piece| w_piece == board[x_axis + 1][y_axis + 1] }
    return [[1, -1]] if @white_pieces.any? { |w_piece| w_piece == board[x_axis + 1][y_axis - 1] }

    []
  end

  def promotion?(new_position)
    x_axis = new_position[0]
    # returns true if the piece has reached the end of the board
    # as pawns can only move forward, a colour doesn't need to be specifed
    return true if x_axis.zero? || x_axis == 7

    false
  end

  def promote_choice(pawn)
    puts "Your Pawn has reached the opponent's back rank. This means you can promote your Pawn to any piece except King"
    puts 'Please enter the corresponding number of the piece you would like to promote it to'
    puts '1: Queen, 2: Bishop, 3: Rook, 4: Knight'
    choice_int = gets.chomp.to_i

    until choice_int.between?(1, 4)
      puts 'Error. Please enter just the number of the piece you would like to promote your Pawn to'
      puts '1: Queen, 2: Bishop, 3: Rook, 4: Knight'
      choice_int = gets.chomp.to_i
    end
    promotion_choice_to_piece(pawn, choice_int)
  end
end
