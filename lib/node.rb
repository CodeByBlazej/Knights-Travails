# creates node object for every move
class Node
  attr_accessor :current_position, :parent

  def initialize(current_position, parent)
    @current_position = current_position
    @parent = parent
  end

  def available_moves
    moves = [-2, -1, 1, 2].shuffle
    allowed_moves = moves.permutation(2).reject { |a, b| (a + b).zero? }
    potential_moves = allowed_moves.map { |a, b| [a + @current_position[0], b + @current_position[1]] }
    potential_moves.select do |a, b|
      a >= 0 && a <= 7 && b >= 0 && b <= 7
    end.map { |move| Node.new(move, self) }
  end
end
