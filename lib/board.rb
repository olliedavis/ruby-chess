require_relative 'pieces'
class Chessboard
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
    current_board
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
end

Chessboard.new