require_relative 'board'
require_relative 'modules/Pieces'
require_relative 'modules/Converter'
require_relative 'modules/InputValidator'
require_relative 'modules/InCheck'
Dir['../lib/pieces/*.rb'].sort.each { |file| require file }

class Chess
  attr_reader :board

  include Pieces
  include Converter
  include InputValidator
  include InCheck

  def initialize
    @chessboard = Chessboard.new
    @board = @chessboard.board
    @black_pieces = ['♔', '♕', '♗', '♖', '♘', '♙']
    @white_pieces = ['♚', '♛', '♝', '♜', '♞', '♟']
    @pawns = ['♙', '♟']
    @turn_counter = 0
  end

  def start_round
    @chessboard.current_board
    first_input = first_choice_input
    second_input = second_choice_input(first_input)
    move_piece(first_input, second_input)
    post_move_checks(second_input)
    @turn_counter += 1
    start_round
  end

  def first_choice_input
    first_input = choose_piece_input # returns the user's choice
    return first_choice_input if first_choice_validator(first_input) == false # checks if the input is valid

    first_input
  end

  def second_choice_input(first_input)
    second_input = move_piece_input # returns the user's choice

    # checks if the input is valid
    return second_choice_input(first_input) if second_choice_validator(first_input, second_input) == false

    second_input
  end

  def choose_piece_input
    puts "White's turn! Please enter the coordinates of the piece you want to move" if @turn_counter.even?
    puts "Black's turn! Please enter the coordinates of the piece you want to move" if @turn_counter.odd?
    gets.upcase.chomp
  end

  def move_piece_input
    puts 'Please enter the coordinates of where you would like to move your piece'
    puts 'If you would like to change your select piece, please enter UNDO'
    input = gets.upcase.chomp
    return start_round if input.upcase == 'UNDO'

    input
  end

  def move_piece(first_input, second_input)
    piece = input_to_piece(first_input)
    first_index = input_to_index(first_input)
    second_index = input_to_index(second_input)
    @board[first_index[0]][first_index[1]] = ' '
    @board[second_index[0]][second_index[1]] = piece
  end

  def taken_piece?(second_input)
    new_position = input_to_piece(second_input) # converts new new_position to a piece
    if turn_counter.even? && @black_pieces.inlcude?(new_position) # contains black piece and it's white's turn?
      true
    elsif turn_counter.odd? && @white_pieces.inlcude?(new_position) # contains white piece and it's blacks's turn?
      true
    else
      false
    end
  end

  def post_move_checks(second_input)
    pawn_promotion(second_input)
    return unless @turn_counter > 3

    in_check?('black') if @turn_counter.even?
    in_check?('white') if @turn_counter.odd?

    # checkmate? TODO
  end

  def pawn_promotion(second_input)
    index = input_to_index(second_input)
    piece = input_to_piece(second_input)
    return unless ['♙', '♟'].include?(piece) && @pawn.promotion?(index)

    new_piece = @pawn.promote_choice(piece)
    @board[index[0]][index[1]] = new_piece
  end
end
