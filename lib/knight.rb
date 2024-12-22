require_relative "board"

class Knight
  def initialize
    @allowed_move = [1, 2] || [2, 1]
    @board = nil
  end

  def knight_moves(from, to)
    if @board.nil?
      @board = Board.new
    end
    
    @board.add_vertices(from[0], from[1])

    p @board.current_position

    # until @board.graph.include(to)
      
    # end
    
    if @board.graph.include?(to)
      puts @board.graph
    else
      @board.add_vertices(@allowed_move[0], @allowed_move[1])
    end
    
    p @board.graph
    p to
    p @board.current_position
  end

  def move
    
  end

end