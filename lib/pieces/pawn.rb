class Pawn
  attr_reader :moves

  def initialize(current_position, piece)
    @moves = first_move_check(current_position, piece)
  end

  def first_move_check(position, piece)
    if position[0] == 1 || position[0] == 6
      return [[-1, 0], [-2, 0]].freeze if piece == '♟'
      return [[1, 0], [2, 0]].freeze if color == '♙'
    else
      return [-1, 0].freeze if piece == '♟'
      return [1, 0].freeze if color == '♙'
    end
  end
end
