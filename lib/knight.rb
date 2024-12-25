require_relative "board"
require_relative "tree"

class Knight
  def initialize
    @allowed_moves = nil
    @board = nil
  end

  def knight_moves(from, to)
    if @board.nil?
      @board = Board.new
    end
    
    if @board.current_position.empty?
      @board.current_position = [from[0], from[1]]
      @board.graph[from[0]][from[1]] = 1
    end


    p @board.graph
    possible_moves(from, to)

  end

  def possible_moves(from, to)
    
    result = [from]
    return result if @board.current_position == to
      
    # if @allowed_moves.nil?
      moves = [-2, -1, 1, 2]
      @allowed_moves = moves.permutation(2).select { |a, b| a + b != 0 }
      potential_moves = @allowed_moves.map { |a, b| [a + from[0], b + from[1]]}
      filtered_moves = potential_moves.select { |a, b| a >= 0 && a <= 7 && b >= 0 && b <= 7} - @board.current_position
      p @allowed_moves
      p potential_moves
      p filtered_moves
      # end

    arr_for_tree = filtered_moves
    p filtered_moves
    tree = Tree.new(arr_for_tree.dup << @board.current_position)
    tree.build_tree
    tree.pretty_print
    p filtered_moves

    p @allowed_moves.sort

    
    
    if tree.find(to) == to
      puts "yeeeaa!"
      @board.current_position = to
      result << @board.current_position
    elsif tree.find(to) != to
      p filtered_moves
      closest_move = filtered_moves.min_by { |move| (to[0] - move[0]) + (to[1] - move[1]) }
    end
    p closest_move
    
    remove_unpossible_moves(tree)
  end

  def remove_unpossible_moves(tree)

    # tree.pretty_print
  end
end