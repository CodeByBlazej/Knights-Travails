class Vertex
  attr_accessor :next_vertex, :value

  def initialize(x, y)
    @next_vertex = nil
    @value = [x, y]
  end
end