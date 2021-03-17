class Pawn
  attr_reader :moves

  def initialize(piece, current_position)
    @moves = first_move_check(piece, current_position)
  end

  def first_move_check(piece, position)
    if position[0] == 1 || position[0] == 6
      return [[-1, 0], [-2, 0]].freeze if piece == '♟'
      return [[1, 0], [2, 0]].freeze if piece == '♙'
    else
      return [-1, 0].freeze if piece == '♟'
      return [1, 0].freeze if piece == '♙'
    end
  end
end
