require_relative '../modules/Converter'

class Pawn
  attr_reader :moves

  include Converter

  def initialize(piece, first_index, second_index, board)
    @black_pieces = ['♔', '♕', '♗', '♖', '♘', '♙']
    @white_pieces = ['♚', '♛', '♝', '♜', '♞', '♟']
    @moves = move_checking(piece, first_index, second_index, board)
  end

  def move_checking(piece, first_index, second_index, board)
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

  def promotion?(second_index)
    return true if second_index[0].zero? || second_index[0] == 7

    false
  end

  def promote_choice(pawn)
    puts "Your Pawn has reached the opponent's back rank"
    puts 'This means you can promote your Pawn to any piece except King'
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

  def possible_white_moves_for_check(position, board)
    potential_moves = []
    if @black_pieces.any? { |piece| piece == board[position[0] - 1][position[1] - 1] }
      potential_moves << [[position[0] - 1][position[1] - 1]]
    end
    return unless @black_pieces.any? { |piece| piece == board[position[0] - 1][position[1] + 1] }

    potential_moves << [[position[0] - 1][position[1] + 1]]
  end

  def possible_black_moves_for_check(position, board)
    potential_moves = []
    if @white_pieces.any? { |piece| piece == board[position[0] + 1][position[1] + 1] }
      potential_moves << [[position[0] - 1][position[1] - 1]]
    end
    return unless @white_pieces.any? { |piece| piece == board[position[0] + 1][position[1] - 1] }

    potential_moves << [[position[0] - 1][position[1] + 1]]
  end

  def possible_moves(piece, position, board)
    return possible_white_moves_for_check(position, board) if piece == '♟'
    return possible_black_moves_for_check(position, board) if piece == '♙'
  end
end
