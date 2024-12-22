require_relative "lib/board"
require_relative "lib/knight"

class Game
  def initialize
    Knight.new
  end

  board = Board.new(0, 0)
  puts board.graph
end