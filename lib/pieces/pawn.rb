class Pawn
  attr_reader :moves

  def initialize(color, count)
    @moves = first_move_check(color, count)
  end

  def first_move_check(color, count)
    if count.zero? == false
      [-1, 0] if color == 'white'
      [1, 0] if color == 'black'
    else
      [[-1, 0], [-2, 0]] if color == 'white'
      [[1, 0], [2, 0]] if color == 'black'
    end
  end
end
