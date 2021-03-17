require_relative 'board'
require_relative 'pieces'
require_relative 'converter_module'
require_relative 'InputValidator_module'
Dir['../lib/pieces/*.rb'].sort.each { |file| require file }
class Chess
  include Pieces
  include Converter
  include InputValidator

  def initialize
    @chessboard = Chessboard.new
    @black_pieces = ['♖', '♘', '♗', '♕', '♔', '♙']
    @white_pieces = ['♜', '♞', '♝', '♚', '♛', '♟']
    @turn_counter = 0
  end

  def start_round
    first_input = first_choice_input
    first_choice_validator(first_input)
    second_input = second_choice_input(first_input)
    second_choice_validator(first_input, second_input)
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

  def move_piece(first_input, second_input)
    piece = input_to_piece(first_input)
    index = input_to_index(second_input)
    @chessboard.board[index[0]][index[1]] == piece
  end
end
