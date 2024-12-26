require_relative "board"
require_relative "tree"
require "pry-byebug"

class Knight
  def initialize
    @allowed_moves = nil
    @filtered_moves = nil
    @previous_moves = []
    @board = nil
    @tree = nil
  end

  # def knight_moves(from, to)
  #   queue = [from]
  #   visited = { from => nil }

  #   until queue.empty?
  #     current = queue.shift

  #     return build_path(visited, to) if current == to

  #     valid_moves(from, current).each do |move|
  #       next if visited.key?(move)
  #       visited[move] = current
  #       queue << move
  #     end
  #   end
  # end

  # def build_path(visited, to)
  #   path = []
  #   current = to

  #   while current
  #     path.unshift(current)
  #     current = visited[current]
  #   end
  #   path
  # end

  # def valid_moves(from, current)
  #   moves = [-2, -1, 1, 2]
  #   @allowed_moves = moves.permutation(2).select { |a, b| a + b != 0 }
  #   potential_moves = @allowed_moves.map { |a, b| [a + from[0], b + from[1]]}
  #   @filtered_moves = potential_moves.select { |a, b| a >= 0 && a <= 7 && b >= 0 && b <= 7}  

  #   return @filtered_moves << current
  # end

  def knight_moves(from, to)
    if @board.nil?
      @board = Board.new
    end
    
    update_graph(from)

    # p @board.graph
    possible_moves(from, to)

  end

  def possible_moves(from, to, result = [from])
    
    # result = [from]
    return result if @board.current_position == to
    make_tree(from, result)
    
    
    if @tree.find(to) == to
      puts "yeeeaa!"
      @board.current_position = to
      update_graph(from)
      result << @board.current_position
      return result.inspect
    end
    
    if @tree.find(to) != to
      # binding.pry
      # closest_move = @tree.level_order
      closest_move = @filtered_moves.min_by { |move| (to[0] - move[0]).abs + (to[1] - move[1]).abs }
      @board.current_position = closest_move
      update_graph(from)
      result << @board.current_position
    end

    possible_moves(@board.current_position, to, result)
  end

  def make_tree(from, result)
    moves = [-2, -1, 1, 2]
    @allowed_moves = moves.permutation(2).select { |a, b| a + b != 0 }
    potential_moves = @allowed_moves.map { |a, b| [a + from[0], b + from[1]]}
    @filtered_moves = potential_moves.select { |a, b| a >= 0 && a <= 7 && b >= 0 && b <= 7 && !result.include?([a, b])}
    # p @allowed_moves
    # p potential_moves
    # p @filtered_moves
    

    arr_for_tree = @filtered_moves
    # p @filtered_moves
    @tree = Tree.new(arr_for_tree.dup << @board.current_position)
    @tree.build_tree
    @tree.pretty_print
    # p @filtered_moves
  end

  def update_graph(from)
    if @board.current_position.empty?
      @board.current_position = [from[0], from[1]]
      @board.graph[from[0]][from[1]] = 1
    else
      @board.graph[from[0]][from[1]] = 0
      @board.graph[@board.current_position[0]][@board.current_position[1]] = 1
    end
  end
end