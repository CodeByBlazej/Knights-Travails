require_relative "vertex"

class Board
 
  def initialize(x, y)
    @vertex_x = x
    @vertex_y = y
  end

  def append(x, y)
    if @vertex_x.nil?
      @vertex_x = Vertex.new()
    end
  end
end