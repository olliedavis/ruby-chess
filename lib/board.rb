require_relative 'modules/Pieces'
Dir['../lib/pieces/*.rb'].sort.each { |file| require file }

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
  
  def position_taken?(new_position)
    return true if @board[new_position] != ' '

    false
  end

  def taken_piece(position, piece)
    @board[position] = piece
  end

  def pieces_left_count
    count = 0
    @board.each do |row|
      row.each do |square|
        count += 1 if square != ' '
      end
    end
    count
  end
end