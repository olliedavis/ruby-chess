require_relative 'pieces'
class Chessboard
  attr_accessor :board

  include Pieces
  
  def initialize
    @board = [
      [BLACK_ROOK, BLACK_KNIGHT, BLACK_BISHOP, BLACK_QUEEN, BLACK_KING, BLACK_BISHOP, BLACK_KNIGHT, BLACK_ROOK],
      [BLACK_PAWN] * 8,
      [' '] * 8,
      [' '] * 8,
      [' '] * 8,
      [' '] * 8,
      [WHITE_PAWN] * 8,
      [WHITE_ROOK, WHITE_KNIGHT, WHITE_BISHOP, WHITE_KING, WHITE_QUEEN, WHITE_BISHOP, WHITE_KNIGHT, WHITE_ROOK]
  ]
    @rows = @board[0..8]
    @columns = @board.transpose[0..8]
  end

  def current_board
    puts "\n --------------------------------- "
    8.times do |y|
      print "#{8 - y}|"
      8.times do |n|
        print " #{@board[y][n]} |"
      end
      puts "\n --------------------------------- "
    end
    puts ' | A | B | C | D | E | F | G | H |'
    puts "\n"
  end

  def position_to_index(position_string)
    positions = %w[a b c d e f g h]
    column = positions.downcase.index(position_string[0])
    row = position_string[1].to_i
    [(8 - row), column]
  end
  
end