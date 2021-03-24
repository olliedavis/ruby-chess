class Bishop
  attr_reader :moves

  def initialize
    @moves = [
      # Up Left Diagonally
      (1..7).map { |n| [-n, -n] }.freeze,
      # Up Right Diagonally
      (1..7).map { |n| [-n, n] }.freeze,
      # Down Left Diagonally
      (1..7).map { |n| [n, -n] }.freeze,
      # Down Right Diagonally
      (1..7).map { |n| [n, n] }.freeze
    ].flatten(1)
  end

  def path(current_position, new_position)
    cur_x = current_position[0]
    cur_y = current_position[1]
    x_diff = cur_x - new_position[0]
    y_diff = cur_y - new_position[1]
    path = []

    if x_diff.positive? && y_diff.positive?
      path.push([cur_x -= 1, cur_y -= 1]) until cur_x.zero? || cur_y.zero?
    elsif x_diff.positive? && y_diff.negative?
      path.push([cur_x -= 1, cur_y += 1]) until cur_x .zero? || cur_y == 7
    elsif x_diff.negative? && y_diff.positive?
      path.push([cur_x += 1, cur_y -= 1]) until cur_x == 7 || cur_y.zero?
    else
      path.push([cur_x += 1, cur_y += 1]) until cur_x == 7 || cur_y == 7
    end
  end
end
