require_relative 'board'
require_relative 'pieces'
require_relative 'converter_module'
Dir['../lib/pieces/*.rb'].sort.each { |file| require file }
class Chess
  include Pieces
  include Converter
  def initialize
    @chessboard = Chessboard.new
    @black_pieces = ['♖', '♘', '♗', '♕', '♔', '♙']
    @white_pieces = ['♜', '♞', '♝', '♚', '♛', '♟']
    @turn_counter = 0
  end

  def start_round
    first_input = first_choice_input
    second_input = second_choice_input(first_input)
  end

  def first_choice_input
    first_input = choose_piece_input # returns the user's choice
    first_choice_validator(first_input) # checks if the input is valid
    first_input
  end

  def second_choice_input(first_input)
    second_input = move_piece_input # returns the user's choice
    second_choice_validator(first_input, second_input) # checks if the input is valid
    second_input
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

  def second_choice_validator(first_input, second_input)
    # returns to 2nd choice input if input is not valid
    second_choice_input if valid_input?(second_input) == false || legal_move?(first_input, second_input) == false 
  end

  def valid_input?(input)
    return true if input.length == 2 && input[0].between?('A', 'H') && input[1].between?('1', '8')

    puts 'Unrecognised input - Please try again like this: B2'
    false
  end

  def valid_piece?(input)
    # converts input to equivalent index and checks if that index matches a piece of their color
    index = input_to_index(input) 
    if @turn_counter.even? && @white_pieces.any? { |piece| @chessboard.board[index[0]][index[1]] == piece }
      true
    elsif @turn_counter.odd? && @black_pieces.any? { |piece| @chessboard.board[index[0]][index[1]] == piece }
      true
    else
      puts 'Unrecognised Piece - Please try again'
      false
    end
  end

  def legal_move?(first_input, second_input)
    piece_class = input_to_class(first_input) # converts the first input to a class
    original_position = input_to_index(first_input) # converts the first input to index
    new_position = input_to_index(second_input) # converts the second input to index
    piece_class.moves.each do |x, y| # returns true if new position matches any of the piece's move set
      return true if new_position == [(original_position[0] + x), (original_position[1] + y)]
    end
  end
end
