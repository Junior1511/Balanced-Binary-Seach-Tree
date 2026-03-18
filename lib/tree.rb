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
    
    current_node = @root
    previous_value = nil
    return if self.include?(value)
    while current_node.data != previous_value
      previous_value = current_node.data
      if value < current_node.data 
          unless current_node.left.nil?
            current_node = current_node.left 
          end
      elsif value > current_node.data 
          unless current_node.right.nil?
            current_node = current_node.right 
          end
      end
    end
    if value > previous_value
      current_node.right = Node.new(value,nil,nil)
    elsif previous_value == nil
      return  Node.new(value,nil,nil)
    else 
      current_node.left = Node.new(value,nil,nil)
    end
    return @root
  end

  def delete(value)
    # ends the method early if it does not include the value
    return unless self.include?(value) 
    current_node = @root
    previous_node = nil
    while current_node.data != value
      if value < current_node.data 
        previous_node = current_node
        current_node = current_node.left 
      elsif value > current_node.data 
        previous_node = current_node
        current_node = current_node.right 
      end
    end
    # need to make 3 cases
    # if left and right of current are nil
    # if neither of them is nil
    # if either left or right are nil
    # in this ^^ specific order
    if current_node.left == nil && current_node.right == nil
      if current_node.data < previous_node.data 
        previous_node.left = nil
      else 
        previous_node.right = nil
      end

    end
  end

end