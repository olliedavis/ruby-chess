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

  def game
    @chessboard.current_board
    position = choose_piece_input
    new_position = move_piece_input(position)
    move_piece(position, new_position)
    piece_taken?(new_position)
    @turn_counter += 1
    #check?
    #checkmate?
  end
  
  def choose_piece_input
    puts "White's turn! Please enter the coordinates of the piece you want to move" if @turn_counter.even?
    puts "Black's turn! Please enter the coordinates of the piece you want to move" if @turn_counter.odd?
    position = gets.chomp
    until valid_input?(position)
      puts 'Unrecognised format, please try again'
      position = gets.chomp
    end
    position = @chessboard.position_to_index(position)
    until valid_piece?(position)
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
    game if new_position.downcase == 'change'
    until valid_input?(new_position)
      puts 'Unrecognised format, please try again'
      new_position = gets.chomp
    end
    new_position = @chessboard.position_to_index(new_position)
    p new_position
    # until legal_move?(chosen_position, new_position)
    #   puts "I don't think that is a legal move. Please try again"
    #   puts ''
    #   move_piece_input(chosen_position)
    # end
  end

  def valid_input?(input)
    if input.length == 2
      y_axis = input[0]
      x_axis = input[1]
      return true if y_axis.between?('A', 'H') && x_axis.between?('1', '8')
    end
    false
  end

  def valid_piece?(position)
    return true if @turn_counter.even? && @white_pieces.any? { |piece| @chessboard.board[position[0]][position[1]] == piece }

    return true if @turn_counter.odd? && @black_pieces.any? { |piece| @chessboard.board[position[0]][position[1]] == piece }

    false
  end

  def legal_move?(current_position, new_position)
    piece = index_to_piece(current_position)
    current_piece = current_piece(piece, current_position)
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

  def current_piece(piece, current_position)
    if ['♟', '♙'].include?(piece)
      piece_to_class(piece, current_position)
    else
      piece_to_class(piece)
    end
  end

  def move_piece(current_position, new_position)
    @chessboard.board[new_position[0][new_position[1]]] = current_position
  end
  
end