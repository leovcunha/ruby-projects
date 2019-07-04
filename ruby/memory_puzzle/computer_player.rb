#The computer player's strategy should be as follows:

#On its first guess, if it knows where 2 matching cards are, guess one of them, 
#otherwise guess randomly among cards it has not yet seen.
#On its second guess, if its first guess revealed a card whose value matches a known 
#location, guess that location, otherwise guess randomly among cards it has not yet seen.
#Now comes the tricky part. With the HumanPlayer, we didn't need to explicitly 
#receive the data from the card we're flipping over; we just read it off the terminal output. 

#NB: The game shouldn't have to know whether a human or computer is playing. Instead,
#it should use duck typing. This may involve writing some "dummy" methods on the 
#HumanPlayer class. That's ok.
require_relative "board.rb"

class ComputerPlayer
    def initialize(rows,cols)
        @name = "computer"
        @known_cards = Board.new(rows,cols)
        @my_turn = false
        @next_move = nil
        @prev_guess = []
    end
    attr_reader :name
    attr_accessor :known_cards, :my_turn, :prev_guess
    
#receive_revealed_card should take in a position and the value of the card revealed 
#at that location. It should then store it in a @known_cards hash.
    def receive_revealed_card(val, pos)
        row, col = pos
        known_cards[row, col] = val 
        analyze(val, row, col)
        prev_guess.empty? ? prev_guess << pos : prev_guess.pop 
    end

    def analyze(val, row, col)
        if prev_guess[0]
            pr, pc = prev_guess[0]
            if known_cards[row,col] == known_cards[pr,pc]
                known_cards[row,col] = "*"
                known_cards[pr,pc]= "*" 
            end
        end
        count = [] 
        known_cards.grid.each_with_index do |x,i| 
            x.each_with_index do |card,j|
                count << [i,j] if card == val
                if prev_guess[0] && card != "*"
                    @next_move = [i,j] if card == known_cards[prev_guess[0][0], prev_guess[0][1]] && [i,j] != prev_guess[0]
                elsif count.length == 2
                    count[0] == [row,col] ? @next_move = count[1] : @next_move = count[0] 
                end
            end
        end 
    end
    
    def random_move
         known_cards.grid.each_with_index do |x,i| 
            x.each_with_index do |card,j|
                return [i,j] if card == nil
            end
        end  
    end

    def get_input
        move, @next_move = @next_move, nil
        move = random_move if move == nil
        move
    end
        
    
end