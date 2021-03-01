require_relative 'pieces'
class Chessboard
  include Pieces
  def initialize
    @board = [' '] * 64
    current_board
  end

  def current_board
    puts "\n --------------------------------- "
    8.times.reverse_each do |y|
      print "#{y + 1}|"
      8.times do |n|
        print " #{@board[n]} |"
      end
      puts "\n --------------------------------- "
    end
    puts ' | A | B | C | D | E | F | G | H |'
    puts "\n"
  end
end
