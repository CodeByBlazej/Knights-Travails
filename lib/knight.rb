require_relative "board"
require "pry-byebug"

class Knight
  def initialize
  end

  def knight_moves(from, to)
    first_node = Board.new(from, nil)

    queue = [first_node]
    visited = [from]

    until queue.empty?
      current = queue.shift
      return build_path(current) if current.current_position == to

      children = current.available_moves
      # binding.pry
      children.each do |child|
        unless visited.include?(child.current_position)
          visited << child.current_position
          queue << child
        end
      end
    end
  end

  def build_path(to)
    path = []
    current = to

    while current
      path << current.current_position
      current = current.parent
    end
    path.reverse
  end
end