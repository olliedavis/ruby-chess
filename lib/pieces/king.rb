require_relative '../board'
require_relative '../game'
class King
  def initialize(color, current_position_index, new_position_index)
    @color = color
    @current_position_index = current_position_index
    @new_position_index = new_position_index
    @moves = [[-1, -1], [-1, 0], [-1, 1],[0, -1],[0, 1], [1, -1], [1, 0], [1, 1]].freeze
  end

  def legal_move?
    @moves.each do |x, y|
      x_axis = @current_position_index[0] + x
      y_axis = @current_position_index[1] + y
      potential_position = [x_axis, y_axis]
      return true if potential_position == @new_position_index
    end
  end
end
