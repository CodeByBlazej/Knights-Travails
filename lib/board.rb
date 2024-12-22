require_relative "vertex"

class Board
  attr_accessor :graph, :current_position, :vertex_x, :vertex_y

  def initialize
    @vertex_x = nil
    @vertex_y = nil
    @current_position = []
    # @graph = []
    @graph = Array.new(8) { Array.new(8) }

  end

  def add_vertices(x, y)
    @vertex_x = Vertex.new(x)
    @vertex_y = Vertex.new(y)
    @graph[]
    @graph << @vertex_x.value
    @graph << @vertex_y.value
    @current_position = [x, y]
  end
end

# make graph using Array.new method to set up the size of the graph.
# then in knight method make a loop to keep moving knight either 1,2 2,1
# or -1, -2 or -2, -1