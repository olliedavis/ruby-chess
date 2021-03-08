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
    @taken_white_pieces = 0
    @taken_black_pieces = 0
  end

  def start
    position = choose_piece_input
    new_position = move_piece_input(position)
    piece_taken?(new_position)
    @turn_counter += 1 
    check?
    checkmate?
  end
  
  def choose_piece_input
    puts "White's turn! Please enter the coordinates of the piece you want to move" if @turn_counter.even?
    puts "Black's turn! Please enter the coordinates of the piece you want to move" if @turn_counter.odd?
    position = gets.chomp
    position = @chessboard.position_to_index(position)
    until valid_input?(position) && valid_piece?(position)
      puts 'Are you sure that position contains one of your pieces? Please try again.'
      puts ''
      choose_piece_input
    end
    position
  end

  def move_piece_input(chosen_position)
    puts 'Please enter the coordinates of where you would like to move your piece'
    puts "If you have changed your mind and want to move a different piece, please type 'Change'"
    new_position = gets.chomp
    start if new_position.downcase == 'change'
    new_position = @chessboard.position_to_index(position)
    until valid_input?(position) && legal_move?(chosen_position, new_position)
      puts "I don't think that is a legal move. Please try again"
      puts ''
      move_piece_input(chosen_position)
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

  def valid_piece?(position)
    position = @chessboard.position_to_index(position)
    return true if @turn_counter.even? && @white_pieces.any? { |piece| @chessboard.board[position[0]][position[1]] == piece }

    return true if @turn_counter.odd? && @black_pieces.any? { |piece| @chessboard.board[position[0]][position[1]] == piece }

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
    @chessboard.board[position[0].to_i][position[1].to_i]
  end
  
  def piece_taken?(new_position)
    if @turn_counter.odd? && @white_pieces.any? { |piece| piece == index_to_piece(new_position) }
      @taken_white_pieces += 1
      true
    elsif @turn_counter.even? && @black_pieces.any? { |piece| piece == index_to_piece(new_position) }
      @taken_black_pieces += 1
      true
    else
      false
    end
  end
end
