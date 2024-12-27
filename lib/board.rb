require_relative "vertex"

class Board
  attr_accessor :current_position, :parent, :filtered_moves

  def initialize(current_position, parent)
    @current_position = current_position
    @parent = parent
    @filtered_moves = nil
  end

  def available_moves
    moves = [-2, -1, 1, 2]
    allowed_moves = moves.permutation(2).select { |a, b| a + b != 0 }
    potential_moves = allowed_moves.map { |a, b| [a + @current_position[0], b + @current_position[1]]}

    # valid_moves = potential_moves.select do |a, b|
    #   a.between?(0, 7) && b.between?(0,7)
    # end

    # @filtered_moves = valid_moves.map do |move|
    #   Board.new(move, self)
    # end
    @filtered_moves = potential_moves.select { |a, b| a >= 0 && a <= 7 && b >= 0 && b <= 7}.map { |move| Board.new(move, self) } 
  
    # return @filtered_moves
  end
end