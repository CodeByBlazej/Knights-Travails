require_relative "lib/board"
require_relative "lib/knight"

class Game
  attr_accessor :knight

  def initialize
    @knight = Knight.new()
  end

  # board = Board.new(0, 1)
  # puts board.graph
  # puts board.graph[0].value
  # puts board.graph[1].value
  def play
    @knight.knight_moves([0, 0], [7, 7])
    
  end

end