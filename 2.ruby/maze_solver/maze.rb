class Maze
    
    def initialize(filename)
        @maze = File.readlines(filename).map {|el| el.chomp.split("")}
        @starting_point = @maze.index {|arr| }
    end
    
    def print_it
        @maze.each {|sub| puts sub.join("")}
    end

    def [](*pos)
        @maze[pos[0]][pos[1]]
    end

    def mark(pos)
        @maze[pos[0]][pos[1]] = 'X'
    end
    
    def starting_point
        position = []
        position << @maze.index {|arr| arr.include?("S")}
        position << @maze[position[0]].index("S")
        position
    end
    
    def is_goal?(position)
        self[*position] == "E"
    end
    
    def get_successors(pos)
        north = [pos[0]-1, pos[1]]
        south = [pos[0]+1, pos[1]]
        east = [pos[0], pos[1]+1]
        west = [pos[0], pos[1]-1]
        succs = []
        
        succs << north unless self[*north] == "*" || self[*north] == nil
        succs << east unless self[*east] == "*" || self[*east] == nil
        succs << south unless self[*south] == "*" || self[*south] == nil
        succs << west unless self[*west] == "*" || self[*west] == nil
        succs
    end

    
end