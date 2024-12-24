class Node
  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = left
    @right = right
  end

  def sorted_arr_to_BST_recur(arr, first, last)
    return nil if first > last

    mid = first + (last - first) / 2

    root = Node.new(arr[mid])

    root.left = sorted_arr_to_BST_recur(arr, first, mid - 1)

    root.right = sorted_arr_to_BST_recur(arr, mid + 1, last)

    return root
  end

  def sorted_array_to_BST(arr)
    return sorted_arr_to_BST_recur(arr, 0, arr.size - 1)
  end

  def find_node(root, x)
    return if root.nil?

    return root.data if root.data == x

    left_result = find_node(root.left, x)
    return left_result if left_result

    find_node(root.right, x)
  end

end