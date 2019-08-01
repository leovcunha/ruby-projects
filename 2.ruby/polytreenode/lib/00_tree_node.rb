class PolyTreeNode

#An #initialize(value) method that sets the value, and starts parent as nil, and children to an empty array.
def initialize(value)
    @value = value
    @parent = nil
    @children = []
end

#A #parent method that returns the node's parent.
#A #children method that returns an array of children of a node.
#A #value method that returns the value stored at the node
attr_reader :parent, :children, :value

def parent=(value)
    parent.children.slice!(parent.children.index(self)) if parent
    @parent=value
    value.children << self if value
end

def add_child(child)
    child.parent = self
end

def remove_child(child)
    raise ArgumentError if children.none?(child)
    child.parent = nil
end

def dfs(target_value)
    return self if self.value == target_value
    
    self.children.each do |child| 
        current_node = child.dfs(target_value)
        return current_node if current_node
    end

    nil
end

def bfs(target_value)
    queue = [self]

    until queue.empty?
        current_node = queue.shift
        return current_node if current_node.value == target_value
        queue.concat(current_node.children)
    end

    nil
end

def inspect
    @value.inspect
end

end