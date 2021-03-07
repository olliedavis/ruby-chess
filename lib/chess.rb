require_relative 'board'
require_relative 'pieces'
Dir['../lib/pieces/*.rb'].sort.each { |file| require file }
class Chess
  include Pieces
  def initialize
    @chessboard = Chessboard.new
    @black_pieces = ['♖', '♘', '♗', '♕', '♔', '♙']
    @white_pieces = ['♜', '♞', '♝', '♚', '♛', '♟']
    @turn_counter = 0
  end

  def start
  end

  def choose_piece_input
    puts "White's turn! Please enter the coordinates of the piece you want to move" if @turn_counter.even?
    puts "Black's turn! Please enter the coordinates of the piece you want to move" if @turn_counter.odd?
    piece_index = gets.chomp
    until valid_input?(piece_index) && valid_piece?(piece_index)
      puts 'Are you sure that position contains one of your pieces? Please try again.'
      piece_index = gets.chomp
    end
    piece_index
  end

  def move_piece_input(chosen_position)
    puts 'Please enter the coordinates of where you would like to move your piece'
    puts "If you have changed your mind and want to move a different piece, please type 'Change'"
    position = gets.chomp
    start if position.downcase == 'change'
    until valid_input?(position) && legal_move?(chosen_position, new_position)
      puts "I don't think that is a legal move. Please try again"
      position = gets.chomp
    end
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
    input = @chessboard.position_to_index(input)
    return true if @turn_counter.even? && @white_pieces.any? { |piece| @chessboard.board[input[0]][input[1]] == piece }

    return true if @turn_counter.odd? && @black_pieces.any? { |piece| @chessboard.board[input[0]][input[1]] == piece }

    false
  end

  def legal_move?(current_position, new_position)
    piece = index_to_piece(current_position)
    current_piece =
      if ['♟', '♙'].include?(piece)
        piece_to_class(piece, current_position)
      else
        piece_to_class(piece)
      end
    current_piece.moves.each do |x, y|
      return true if new_position == [(current_position[0] + x), (current_position[1] + y)]
    end
    false
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

  def index_to_piece(position)
    x_axis = position[0].to_i
    y_axis = position[1].to_i
    @chessboard.board[x_axis][y_axis]
  end

end
