require_relative "lib/tree"

t = Tree.new([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
t.pretty_print
t.insert(6)
t.insert(2)
t.insert(59)
t.pretty_print
