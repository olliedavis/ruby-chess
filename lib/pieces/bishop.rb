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
    new_x = new_position[0]
    new_y = new_position[1]
    x_diff = cur_x - new_x
    y_diff = cur_y - new_y

    if x_diff.positive? && y_diff.positive?
      (1..7).map { |n| [cur_x - n, cur_y - n] }
    elsif x_diff.positive? && y_diff.negative?
      (1..7).map { |n| [cur_x - n, cur_y + n] }
    elsif x_diff.negative? && y_diff.positive?
      (1..7).map { |n| [cur_x + n, cur_y - n] }
    else
      (1..7).map { |n| [cur_x + n, cur_y + n] }
    end
  end
end
