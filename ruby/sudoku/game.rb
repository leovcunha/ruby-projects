#The Game should have an instance variable for the Board. It should also have methods 
#for managing the Board-Player interaction. You may want a play loop that runs until 
#the puzzle is solved. Inside the loop, you should render the board, prompt the player
# for input, and then get both a pos and a value from the player. It should then update
# the tile at pos with the new value. I wrote helper methods to get and validate input
#from the user; this should help keep our program from crashing. :)

require_relative 'tile'
require_relative 'board'

class Game
    def initialize(board)
        @board = board
    end
    
    def run
        loop do 
            @board.render 
            value, *pos = prompt_player()
            @board.update_tile(value, *pos)
            break if @board.solved?
        end
        @board.render
        puts "you win!"
    end
    
    def prompt_player
        input = []
        loop do 
            puts "Enter value,row,col (separate by comma):"
            input = gets.chomp.split(",").map(&:to_i)
            p input
            break if (0..8).include?(input[1]) && (0..8).include?(input[2]) && (1..9).include?(input[0])
        end
        input
        
    end
    
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new(Board.from_file("puzzles/sudoku1_almost.txt"))
  game.run
end