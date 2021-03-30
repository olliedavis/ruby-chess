require 'json'
require_relative 'board'

Dir['./lib/pieces/*.rb'].sort.each { |file| require file }
Dir['./lib/modules/*.rb'].sort.each { |file| require file }

class Chess
  attr_reader :board

  include Pieces
  include Converter
  include InputValidator
  include InCheck
  include Checkmate
  include Save
  include LoadSave

  def initialize
    @chessboard = Chessboard.new
    @board = @chessboard.board
    @black_pieces = ['♔', '♕', '♗', '♖', '♘', '♙']
    @white_pieces = ['♚', '♛', '♝', '♜', '♞', '♟']
    @pawns = ['♙', '♟']
    @turn_counter = 0
  end

  def start_round
    @chessboard.current_board # displays current board
    pre_move_checks # checks for check and checkmate
    first_input = first_choice_input # takes the first input and validates it
    second_input = second_choice_input(first_input) # takes the second input and validates it
    move_piece(first_input, second_input) # moves the piece to the validated position
    post_move_checks(second_input) # checks if Pawn is at back rank
    @turn_counter += 1
    start_round
  end

  def first_choice_input
    first_input = choose_piece_input # returns the user's choice
    return save_prompt if first_input.downcase == 'save'
    return load_game if first_input.downcase == 'load'
    return first_choice_input if first_choice_validator(first_input) == false # checks if the input is valid

    first_input
  end

  def choose_piece_input
    puts "White's turn! Please enter the coordinates of the piece you want to move" if @turn_counter.even?
    puts "Black's turn! Please enter the coordinates of the piece you want to move" if @turn_counter.odd?
    gets.upcase.chomp
  end

  def second_choice_input(first_input)
    second_input = move_piece_input # returns the user's choice

    # checks if the input is valid
    return second_choice_input(first_input) if second_choice_validator(first_input, second_input) == false

    second_input
  end

  def move_piece_input
    puts 'Please enter the coordinates of where you would like to move your piece'
    puts 'If you would like to change your select piece, please enter UNDO'
    input = gets.upcase.chomp
    return start_round if input.upcase == 'UNDO'

    input
  end

  # sets the current position to empty
  # then inserts the piece at the new position
  def move_piece(first_input, second_input)
    piece = input_to_piece(first_input)
    first_index = input_to_index(first_input)
    second_index = input_to_index(second_input)
    @board[first_index[0]][first_index[1]] = ' '
    @board[second_index[0]][second_index[1]] = piece
  end

  def post_move_checks(second_input)
    pawn_promotion(second_input)
  end

  def pre_move_checks
    if @turn_counter.odd? && @turn_counter > 1
      in_check?('black')
      winner('white') if checkmate?('black')
    elsif @turn_counter.even? && @turn_counter > 1
      in_check?('white')
      winner('black') if checkmate?('white')
    end
  end

  def pawn_promotion(second_input)
    index = input_to_index(second_input)
    piece = input_to_piece(second_input)
    return unless ['♙', '♟'].include?(piece) && @pawn.promotion?(index)

    new_piece = @pawn.promote_choice(piece)
    @board[index[0]][index[1]] = new_piece
  end

  def winner(colour)
    puts 'CHECKMATE!'
    puts "Congratulations #{colour.capitalize}, you win!"
    puts 'Do you want to play again? (y/n)'
    play_again?
  end

  def play_again?
    decision = gets.downcase.chomp
    case decision
    when 'y'
      Chess.new.start_round
    when 'n'
      puts ':('
      exit
    else
      puts "I don't understand, please enter either y or n"
    end
  end
end
