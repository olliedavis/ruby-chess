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

  def start_turn
    input = choose_piece_input
  end

  def choose_piece_input
    puts "White's turn! Please enter the coordinates of the piece you want to move" if @turn_counter.even?
    puts "Black's turn! Please enter the coordinates of the piece you want to move" if @turn_counter.odd?
    gets.upcase.chomp
  end

  def valid_input?(input)
    return true if input.length == 2 && input[0].between?('A', 'H') && input[1].between?('1', '8')

    puts 'Unrecognised input - Please try again like this: B2'
    false
  end

  def valid_piece?(input)
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

  def validator(input)
    choose_piece_input if valid_input?(input) || valid_piece?(input) == false
  end
end
