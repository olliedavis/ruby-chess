require_relative '../modules/PathCreator'

class Rook
  attr_reader :moves

  include PathCreator

  def initialize(current_position, board)
    all_paths = path_creator(current_position, all_moves)
    @moves = path_checker(all_paths, board)
  end

  def all_moves
    [(1..7).map { |n| [-n, 0] }.freeze, # up
     (1..7).map { |n| [n, 0] }.freeze,  # down
     (1..7).map { |n| [0, -n] }.freeze, # left
     (1..7).map { |n| [0, n] }.freeze]  # right
  end
end
