require_relative "board"
require_relative "player"

class Battleship
    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = (@board.size / 2).round        
    end

    attr_reader :board, :player

    def start_game
        @board.place_random_ships
        puts @board.num_ships
        @board.print
    end

    def lose?
        return false if !(@remaining_misses <= 0)
        puts 'you lose' 
        true
    end

    def win?
        return false if !(@board.num_ships == 0)
        puts 'you win';
        true
    end

    def game_over?
        return true if lose? || win?
        false
    end

    def turn
        pos = @player.get_move
        if @board.attack(pos) == false
            @remaining_misses -= 1
        end
        @board.print
        puts @remaining_misses
    end
end
