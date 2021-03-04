class Bishop
  attr_reader :moves
  def initialize
    up_left_diag = (-8..-1).zip(-8..-1).reverse
    @moves = [up_left_diag]
  end
end
