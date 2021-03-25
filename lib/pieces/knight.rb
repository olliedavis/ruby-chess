require_relative '../modules/PathCreator'

class Knight
  attr_reader :moves

  include PathCreator

  def initialize(current_position, board)
    all_moves = [[[-2, -1], [-1, -2], [-2, 1], [-1, 2], [1, -2], [2, -1], [1, 2], [2, 1]]]
    all_paths = path_creator(current_position, all_moves)
    @moves = path_checker(all_paths, board)
  end
end
