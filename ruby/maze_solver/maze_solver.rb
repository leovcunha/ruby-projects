require_relative 'maze.rb'
require "set"

class Maze_solver
    def initialize()
        
    end
    
    def solve_maze(filename)
        @maze = Maze.new(filename)
        path = self.bfs_search
        self.trace(path)
    end
    
    def bfs_search
        queue = Queue.new
        discovered = Set.new
        queue << [@maze.starting_point, []] #vertex, path
        
        until queue.empty?
            vertex, path = queue.pop
            return path if @maze.is_goal?(vertex)
            discovered << vertex
            edges = @maze.get_successors(vertex)
            edges.each do |edge|
                unless discovered === edge
                    queue << [edge, path + [edge]]
                end
            end
        end
        raise "Maze unsolvable"
    end
    
    def trace(path)
        path.each {|vertex| @maze.mark(vertex)}
        @maze.print_it
        true
    end
end

if __FILE__ == $PROGRAM_NAME
    begin 
        puts "Enter the maze filename:"
        filename = gets.chomp
        solver = Maze_solver.new
        solver.solve_maze(filename)
    rescue RuntimeError => e
        puts e.message
    end
end

        