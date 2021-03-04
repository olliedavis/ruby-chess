class Pawn
  attr_reader :moves
  def initialize
    @white_first_moves = [[-1, 0], [-2, 0]]
    @black_first_moves = [[1, 0], [2, 0]]
    @white_moves = [-1, 0]
    @black_moves = [1, 0]
  end
end
