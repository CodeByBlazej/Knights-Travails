require_relative "lib/node"
require_relative "lib/knight"

# Game class is responsible for creating knight object
class Game
  def initialize
    @knight = Knight.new
  end

  def play
    @knight.knight_moves([0, 0], [7, 7])
  end
end
