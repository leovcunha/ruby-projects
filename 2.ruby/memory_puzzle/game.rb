#Game
#The Game should have instance variable for the Board and the previously-guessed 
#position (if any). It should also have methods for managing the Board-Player interaction. #
#You may want a play loop that runs until the game is over. Inside the loop, you should render #
#the board, prompt the player for input, and get a guessed pos. Pass this pos to a make_guess method,
#where you will handle the actual memory/matching logic. Some tips on implementing this:

#Run system("clear") before rendering the Board. This will hide any previous output from the player. 
#sleep(n) will pause the program for n seconds. Use this method to (temporarily) show the player an incorrect 
#guess before flipping the Cards face-down again.
require_relative "board.rb"
require_relative "human_player.rb"
require_relative "computer_player.rb"

class Game
    def initialize(rows, cols, *players)
        @board = Board.new(rows, cols)
        @previous_guess = []
        @players = players
        @current_player = @players[0]
    end
    
    attr_reader :previous_guess, :players
    
    def run
        @board.populate
        turn = 0
        loop do
            sleep(1)
            @board.render
            puts "#{@current_player.name} turn:"
            pos = @current_player.get_input
            puts pos
            make_guess(pos)
            turn += 1
            switch_player! if turn % 2 == 0
            break if @board.won?
        end
    end
    
    def switch_player!
        @players.rotate!
        @current_player = @players[0]
    end
#If we're not already checking another Card, leave the card at guessed_pos face-up and update the previous_guess variable.
#If we are checking another card, we should compare the Card at guessed_pos with the one at previous_guess.
#If the cards match, we should leave them both face-up.
#Else, flip both cards face-down.
#In either case, reset previous_guess.
#It wouldn't be an interesting game if the player could see their previous moves. 
    def make_guess(pos)
        val = @board.reveal(*pos)
        @board.render
        @players.each {|p| p.receive_revealed_card(val, pos)}
        if @previous_guess.empty?
            @previous_guess << pos
            return
        elsif @board[*pos].display == @board[*previous_guess[0]].display
            puts "It's a match!"
        else
            puts "Try again"
            @board[*pos].flip
            @board[*previous_guess[0]].flip
        end
        @previous_guess.pop
    end
    
    
end

if __FILE__ == $PROGRAM_NAME
  human = HumanPlayer.new("Meme")
  computer = ComputerPlayer.new(5,4)
  game = Game.new(5,4, human, computer)
  game.run
end