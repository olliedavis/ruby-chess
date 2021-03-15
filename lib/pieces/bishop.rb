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

  def direction(current_position, new_position)
    if (current_position[0] - new_position[0]).positive? && (current_position[1] - new_position[1]).positive?
      upwards_left
    elsif (current_position[0] - new_position[0]).positive? && (current_position[1] - new_position[1]).negative?
      upwards_right
    elsif (current_position[0] - new_position[0]).negative? && (current_position[1] - new_position[1]).positive?
      downwards_left
    else
      downwards_right
    end
  end
end