class Pawn
  attr_reader :moves

  def initialize(current_position, color = 'white')
    @moves = first_move_check(current_position, color)
  end

  def first_move_check(position, color)
    if position[0] == 1 || position[0] == 6
      [[-1, 0], [-2, 0]].freeze if color == 'white'
      [[1, 0], [2, 0]].freeze if color == 'black'
    else
      [-1, 0].freeze if color == 'white'
      [1, 0].freeze if color == 'black'
    end
  end
end
