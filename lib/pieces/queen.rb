class Queen
  attr_reader :moves

  def initialize
    @moves = [
      (1..7).map { |n| [-n, 0] }.freeze, # up
      (1..7).map { |n| [n, 0] }.freeze, # down
      (1..7).map { |n| [0, -n] }.freeze, # left
      (1..7).map { |n| [0, n] }.freeze, # right
      (1..7).map { |n| [-n, -n] }.freeze, # up left
      (1..7).map { |n| [-n, n] }.freeze, # up right
      (1..7).map { |n| [n, -n] }.freeze, # down left
      (1..7).map { |n| [n, n] }.freeze # down right
    ].flatten(1)
  end

  def path(current_position, new_position)
    cur_x = current_position[0]
    cur_y = current_position[1]
    x_diff = cur_x - new_position[0]
    y_diff = cur_y - new_position[1]

    if x_diff.zero? || y_diff.zero?
     p path_straight(cur_x, cur_y, x_diff, y_diff)
    else
     p path_diagn(cur_x, cur_y, x_diff, y_diff)
    end
  end

  def path_straight(cur_x, cur_y, x_diff, y_diff)
    path = []

    if x_diff.positive?
      path.push([cur_x -= 1, cur_y]) until cur_x.zero?
    elsif x_diff.negative?
      path.push([cur_x += 1, cur_y]) until cur_x == 7
    elsif y_diff.positive?
      path.push([cur_x, cur_y -= 1]) until cur_y.zero?
    else
      path.push([cur_x, cur_y += 1]) until cur_y == 7
    end
    path
  end

  def path_diagn(cur_x, cur_y, x_diff, y_diff)
    path = []

    if x_diff.positive? && y_diff.positive?
      path.push([cur_x -= 1, cur_y -= 1]) until cur_x.zero? || cur_y.zero?
    elsif x_diff.positive? && y_diff.negative?
      path.push([cur_x -= 1, cur_y += 1]) until cur_x.zero? || cur_y == 7
    elsif x_diff.negative? && y_diff.positive?
      path.push([cur_x += 1, cur_y -= 1]) until cur_x == 7 || cur_y.zero?
    else
      path.push([cur_x += 1, cur_y += 1]) until cur_x == 7 || cur_y == 7
    end
    path
  end
end

Queen.new.path([5, 4], [2, 1])