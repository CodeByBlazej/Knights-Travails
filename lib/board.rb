require_relative "vertex"

class Board
  attr_accessor :graph, :vertex_x, :vertex_y

  def initialize(x, y)
    @vertex_x = Vertex.new(x)
    @vertex_y = Vertex.new(y)
    @graph = [@vertex_x, @vertex_y]
  end

  def append(x, y)
    if @vertex_x.nil?
      @vertex_x = Vertex.new()
    end
  end
end