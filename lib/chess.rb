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

  def first_choice_input
    input = choose_piece_input # returns the user's choice
    first_choice_validator(input) # checks if the input is valid
  end

  def second_choice_input
    input = move_piece_input # returns the user's choice
    second_choice_validator(input) # checks if the input is valid
  end

  def choose_piece_input
    puts "White's turn! Please enter the coordinates of the piece you want to move" if @turn_counter.even?
    puts "Black's turn! Please enter the coordinates of the piece you want to move" if @turn_counter.odd?
    gets.upcase.chomp
  end

  def move_piece_input
    puts 'Please enter the coordinates of where you would like to move your piece'
    gets.upcase.chomp
  end

  def first_choice_validator(input)
    # returns to start if input is not valid
    first_choice_input if valid_input?(input) == false || valid_piece?(input) == false 
  end

  def second_choice_validator(input)
    # returns to 2nd choice input if input is not valid
    second_choice_input if valid_input?(input) == false || legal_move?(input) == false # legal move? to be added
  end

  def valid_input?(input)
    return true if input.length == 2 && input[0].between?('A', 'H') && input[1].between?('1', '8')

    puts 'Unrecognised input - Please try again like this: B2'
    false
  end

  def valid_piece?(input)
    # converts input to eqivalent index and checks if that index matches a piece of their color
    index = @chessboard.input_to_index(input) 
    if @turn_counter.even? && @white_pieces.any? { |piece| @chessboard.board[index[0]][index[1]] == piece }
      true
    elsif @turn_counter.odd? && @black_pieces.any? { |piece| @chessboard.board[index[0]][index[1]] == piece }
      true
    else
      puts 'Unrecognised Piece - Please try again'
      false
    end
  end
end
