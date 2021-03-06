require_relative 'board'
require_relative 'pieces'
Dir['../lib/pieces/*.rb'].sort.each { |file| require file }
class Chess
  include Pieces
  def initialize
    @board = Chessboard.new.board
    # These obviously doesn't work as it can't take convert a string to an integer
    # Need to look into alternate method to return the index of the consts
    @white_pieces = [ 
      @board[WHITE_KING], @board[WHITE_QUEEN], @board[WHITE_ROOK], 
      @board[WHITE_BISHOP], @board[WHITE_KNIGHT], @board[WHITE_PAWN]
    ]
    @black_pieces = [
      @board[BLACK_KING], @board[BLACK_QUEEN], @board[BLACK_ROOK],
      @board[BLACK_BISHOP], @board[BLACK_KNIGHT], @board[BLACK_PAWN]
    ]
    @turn_counter = 0
  end

  def player_input
    if @turn_counter.zero?
      puts "White's turn! Please enter the position of the piece you want to move"
    else
      puts "Black's turn! Please enter the position of the piece you want to move"
    end

    piece = gets.chomp
    until valid_piece?(piece)
      puts 'Are you sure that position contains one of your pieces? Please try again.'
      piece = gets.chomp
    end
  end

  def move_validator(piece, input, current_position_index, new_position_index)
    valid_position?(input)
    legal_move?(piece, current_position_index, new_position_index)
  end

  def valid_input?(input)
    if input.length == 2
      y_axis = input[0].to_i
      x_axis = input[1]
      return true if y_axis.between?(1, 8) && x_axis.downcase.between?('a', 'h')
    end
    false
  end

  def valid_piece?(input)
    input = @board.position_to_index(input)
    return true if @turn_counter.zero? && @white_pieces.any? { |piece| @board[input[0]][input[1]] == piece }

    return true if @turn_counter == 1 && @black_pieces.any? { |piece| @board[input[0]][input[1]] == piece }

    false
  end

  def legal_move?(piece, current_position_index, new_position_index)
    current_piece = piece_to_class(piece)
    current_piece.moves.each do |x, y|
      return true if new_position_index == [(current_position_index[0] + x), (current_position_index[1] + y)]
    end
  end
end
