require_relative 'lib/chess'

class Game
  def self.start
    introduction
    Chess.new.start_round
  end

  def self.introduction
    puts 'Welcome to chess!'
    puts ''
    puts 'Two players will take it in turn to select a piece, and the position they want to move it to.'
    puts 'When prompted, please enter the name of the piece you want to select (A reminder can be found in the README)'
    puts 'You will then be prompted again for a location to move the above piece to.'
    puts ''
    puts "Ready? Please enter 'Start'"
    prompt = gets.chomp.downcase
    until prompt == 'start'
      puts "Ready? Please enter 'Start'"
      prompt = gets.chomp.downcase
    end
  end
end

Game.start