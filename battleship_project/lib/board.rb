class Board
    def initialize(n)
        @grid = Array.new(n) { Array.new(n, :N)}
        @size = n * n
        @n = n
    end

    attr_reader :size

    def [](arr)
        @grid[arr[0]][arr[1]]
    end

    def []=(arr, val)
        @grid[arr[0]][arr[1]] = val
    end

    def num_ships
        num = 0
        @grid.each {|sub| num += sub.count {|el| el == :S}}
        num
    end
    #=========part 2========
    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts 'you sunk my battleship!'
            return true                       
        end
        self[pos] = :X
        false
    end

    def place_random_ships
        ships = (@size * 0.25)

        while num_ships < ships
            pos = [rand(0...@n), rand(0...@n)]
            self[pos] = :S
        end
    end

    def hidden_ships_grid
        @grid.map {|row| row.map {|ele| ele == :S ? :N : ele}}
    end

    def self.print_grid(grid)
        grid.each {|row| puts row.join(" ")}
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end
end
