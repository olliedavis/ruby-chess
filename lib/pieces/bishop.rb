require_relative '../modules/PathCreator'

class Bishop
  attr_reader :moves

  include PathCreator

  def initialize(current_position, board)
    all_paths = path_creator(current_position, all_moves)
    @moves = path_checker(all_paths, board)
  end

  def all_moves
    [(1..7).map { |n| [-n, -n] }.freeze, # Up Left
     (1..7).map { |n| [-n, n] }.freeze,  # Up Right
     (1..7).map { |n| [n, -n] }.freeze,  # Down Left
     (1..7).map { |n| [n, n] }.freeze]   # Down Right
  end
end
