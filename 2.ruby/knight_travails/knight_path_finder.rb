require_relative '../polytreenode/lib/00_tree_node.rb'

class KnightPathFinder
    def initialize(start)
        @root_node = PolyTreeNode.new(start)
        @considered_positions = [@root_node.value]
        @move_tree = self.build_move_tree(@root_node)
    end
    
    
    def self.valid_moves(pos)
        x,y = pos
        all_possible_moves = [[x-2, y-1], [x-2, y+1], [x-1, y-2], [x-1, y+2], [x+1, y-2], [x+1, y+2], [x+2, y-1], [x+2, y+1]]
        valid = all_possible_moves.select {|move| move[0].between?(0, 7) && move[1].between?(0, 7)}
    end
    
    def new_move_positions(pos)
        valid_moves = KnightPathFinder.valid_moves(pos)
        moves = valid_moves.select {|move| @considered_positions.none? {|p| p == move}}
        @considered_positions = @considered_positions + moves
        moves
    end

    def build_move_tree(start)  
        queue = [start]
    
        until queue.empty?
            current_node = queue.shift
            new_moves = new_move_positions(current_node.value)
            new_moves.each do |pos|
                new_node = PolyTreeNode.new(pos)
                current_node.add_child(new_node)
                queue << new_node
            end
        end

    end

    def find_path(end_pos)
        end_node = @root_node.bfs(end_pos)
        trace_path_back(end_node).reverse.map(&:value)
    end
    
    def trace_path_back(node)
        array = [node]
        return [] if node == nil 
        array += trace_path_back(node.parent)
    end
        

end

if $PROGRAM_NAME == __FILE__
  kpf = KnightPathFinder.new([0, 0])
  p kpf.find_path([7, 7])
  p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
  p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]
end