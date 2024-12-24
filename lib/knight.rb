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
    #if current position is empty then make new currnt pos regarding whats given
    #and count every possible move from there and change current possition
    if @board.current_position.empty?
      @board.current_position = [from[0], from[1]]
      @board.graph[from[0]][from[1]] = 1
    end

    if @board.graph[to[0]][to[1]].nil?
      # possible_moves(to)?????????
    else
      puts "field you want to go to is taken by other chess piece"
    end
    p @board.current_position
    p @board.graph
    possible_moves(from, to)

    # @board.add_vertices(from[0], from[1])

    # p @board.current_position

    # # until @board.graph.include(to)
      
    # # end
    
    # if @board.graph.include?(to)
    #   puts @board.graph
    # else
    #   @board.add_vertices(@allowed_move[0], @allowed_move[1])
    # end
    
    # p @board.graph
    # p to
    # p @board.current_position
  end

  def possible_moves(from, to)
    return if @board.current_position == to
      
    if @allowed_moves.nil?
      moves = [-2, -1, 1, 2]
      @allowed_moves = moves.permutation(2).select { |a, b| a + b != 0 }
      @allowed_moves = @allowed_moves.map { |a, b| [a + from[0], b + from[1]]}
    end

    arr_for_tree = @allowed_moves << @board.current_position
    tree = Tree.new(arr_for_tree)
    tree.build_tree
    tree.pretty_print
    p @allowed_moves.sort


    # p temporary_position
    # @board.graph[0][0] = 1
    # p @board.current_position
    # p @board.graph
  end

end