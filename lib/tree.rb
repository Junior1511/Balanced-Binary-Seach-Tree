# require_relative "node"

class Tree

  class Node
    attr_accessor :data, :left, :right

    def initialize(data = nil, left = nil, right = nil)
      @data = data
      @left = left
      @right = right
    end
  end

  attr_accessor :root

  def initialize(arr)
    @root = nil
    build_tree(arr)
  end

  
  # private_class_method :build_tree

  def build_tree(arr)
    return nil if arr.length < 3
    clean_arr = arr.uniq.sort
    p "clean array #{clean_arr}"
    mid_index = (clean_arr.length / 2.0).round - 1
    mid = clean_arr[mid_index]
    p "mid value #{mid} , mid index #{mid_index}"
    left = clean_arr[0...mid_index]
    right = clean_arr[mid_index+1..-1]
    @root = Node.new(mid, Tree.new(left), Tree.new(right))
    return @root
  end

  def pretty_print(node = @root, prefix = '', is_left: true)
  return unless node

  pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", is_left: false)
  puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
  pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", is_left: true)
  end

end

t = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
p t
