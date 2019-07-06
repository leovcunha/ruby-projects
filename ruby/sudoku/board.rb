#A Board should store a grid of Tiles. Define your Board#initialize method to accept 
#such a grid as an argument. Since our puzzles exist as text files, let's write 
#a Board::from_file factory method to read a file and parse it into a two-dimensional 
#Array containing Tile instances.

require_relative "tile.rb"

class Board
    def initialize(grid)
        @grid = grid
    end
    attr_reader :grid
    
    def self.from_file(filename)
        array = File.readlines(filename).map {|el| el.chomp.split("")}
        grid = array.map do |row|
            row.map {|val| Tile.new(val.to_i)}
        end
        Board.new(grid)
    end
    
#update the value of a Tile at the given position
    def update_tile(val, *pos)
        @grid[pos[0]][pos[1]] = Tile.new(val) unless @grid[pos[0]][pos[1]].given
    end
    
#display the current board state
    def render
        puts "-------------------------------------"
        @grid.each do |row| 
            puts "| " + row.map(&:to_s).join(" | ") + " |"
            puts "-------------------------------------"
        end
    end

#let us know if the game is over    
    def solved?
        cols = @grid.transpose
        return false unless (0..8).all? {|i| check_cols(i) && check_row(i)}
        (0..2).each do |horiz| 
            (0..2).each {|vert| return false unless check_square(horiz,vert)}
        end
        true
    end
    
    def check_row(row)
        @grid[row].map {|tile| tile.value}.sort == (1..9).to_a
    end
    
    def check_cols(col)
        transgrid = @grid.transpose
        transgrid[col].map {|tile| tile.value}.sort == (1..9).to_a
    end
    
    def check_square(horiz, vert) #(from 0 to 2 horizontal, 0 to 2 vertical )
          row_start, row_end = horiz*3, horiz*3+3 
          col_start, col_end = vert*3, vert*3+3
          select = []
          (row_start...row_end).each do |row|
              (col_start...col_end).each {|col| select << @grid[row][col].value }
          end
          select.sort == (1..9).to_a
    end
end