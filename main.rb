require_relative "lib/tree"

t = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
t.pretty_print
p t.include?(6345)