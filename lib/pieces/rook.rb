class Rook
  attr_reader :moves

  def initialize
    @moves = [
      (1..7).map { |n| [-n, 0] }.freeze, # up
      (1..7).map { |n| [n, 0] }.freeze,  # down
      (1..7).map { |n| [0, -n] }.freeze, # left
      (1..7).map { |n| [0, n] }.freeze   # right
    ].flatten(1)
  end

  def path(current_position, new_position)
    cur_x = current_position[0]
    cur_y = current_position[1]
    x_diff = cur_x - new_position[0]
    y_diff = cur_y - new_position[1]
    path = []

    if x_diff.positive? && y_diff.zero?
      path.push([cur_x -= 1, cur_y]) until cur_x.zero?
    elsif x_diff.negative? && y_diff.zero?
      path.push([cur_x += 1, cur_y]) until cur_x == 7
    elsif y_diff.positive? && x_diff.zero?
      path.push([cur_x, cur_y -= 1]) until cur_y.zero?
    else
      path.push([cur_x, cur_y += 1]) until cur_y == 7
    end
  end
end
