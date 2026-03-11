require_relative "node"

class Tree

  attr_accessor :root

  def initialize(arr)
    @root = build_tree(arr)
  end

  
  # private_class_method :build_tree

  def build_tree(arr)
    clean_arr = arr.uniq.sort
    return nil if clean_arr.empty?
    mid_index = clean_arr.length / 2
    mid_value = clean_arr[mid_index]
    remainder_left = clean_arr[0...mid_index]
    remainder_right = clean_arr[mid_index+1..-1]
    return Node.new(mid_value,build_tree(remainder_left),build_tree(remainder_right))
  end

  def pretty_print(node = @root, prefix = '', is_left: true)
    return unless node

    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", is_left: false)
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", is_left: true)
  end

  def include?(value)
    current_node = @root
    while current_node
      return true if current_node.data == value
      if value < current_node.data
        current_node = current_node.left
      elsif value > current_node.data
        current_node = current_node.right
      end
    end
    false
  end

  def insert(value)
    
  end

end