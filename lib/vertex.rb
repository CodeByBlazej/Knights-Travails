class Vertex
  attr_accessor :next_vertex, :value

  def initialize(value)
    @next_vertex = nil
    @value = value
  end
end