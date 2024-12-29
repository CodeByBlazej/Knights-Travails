require_relative "node"
require "pry-byebug"

# Knight class creates knight object and knight moves
# method that is responsible for nodes manipulation
class Knight
  def knight_moves(from, to)
    first_node = Node.new(from, nil)

    queue = [first_node]
    visited = [from]

    until queue.empty?
      current = queue.shift
      return build_path(current) if current.current_position == to

      children = current.available_moves

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
