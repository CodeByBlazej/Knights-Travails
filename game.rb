require_relative "lib/node"
require_relative "lib/knight"

class Game

  def initialize
    @knight = Knight.new()
  end

  def play
    @knight.knight_moves([0, 0], [7, 7])
  end
end