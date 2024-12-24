require_relative "node"

class Tree
  attr_accessor :arr, :root

  def initialize(arr)
    @arr = arr
    @root = root
  end

  def build_tree
    sorted_arr = @arr.sort.uniq
    new_node = Node.new(sorted_arr)

    @root = new_node.sorted_array_to_BST(sorted_arr)
  end

  def find(data)
    @root.find_node(@root, data)
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end