require_relative 'player.rb'
require 'set'

class Game
    def initialize(players, dictionary)
        raise ArgumentError if players.any? {|el| el == ""} || players.empty?
        @players = players.map {|pl| Player.new(pl)}
        @current_player = @players[0]
        @previous_player = @players[-1]
        @fragment = ""
        @dictionary = dictionary
        @losses = Hash.new(0)
        puts "new game created"
        puts "---------------"
    end
    
    attr_reader :current_player, :previous_player, :fragment
        
    def next_player!
        @players.rotate!
        @current_player = @players[0]
        @previous_player = @players[-1]
    end
    
    #gets a string from the player until a valid play is made; then updates the fragment 
    #and checks against the dictionary. You may also want to alert the player if they attempt
    #to make an invalid move (or, if you're feeling mean, you might cause them to lose outright).
    def take_turn(player)
        puts "It's #{current_player.name}'s turn"
        puts "Current fragment: #{fragment}"
        letter = player.guess
    
        if valid_play?(letter)
          @fragment << letter
        else
          puts "Invalid guess. Please use a valid letter"
          take_turn(player)
        end
    
    end
    
    #Checks that string is a letter of the alphabet and that there are words we can spell 
    #after adding it to the fragment
    def valid_play?(string)
        return false if string.length > 1
        return false unless ("a".."z").include?(string.downcase)
    
        @fragment << string
    
        @dictionary.each do |word|
            if word[0..fragment.length-1] == fragment
                @fragment = @fragment[0...-1]
                return true
            end
        end
        @fragment = @fragment[0...-1]
        false
    end

    def won_round?
        return true if @dictionary === @fragment 
        false
    end
    
    def play_round
        while !won_round?
          take_turn(@current_player)
          next_player!
        end
        puts "#{current_player.name} wins the round"
        puts "#{previous_player.name} gains a letter"
        @losses[previous_player.name] += 1
        puts "#{previous_player.name} has #{@losses[previous_player.name]} letters"
        @fragment = ""
    end
    
    def won_match?
        @losses[previous_player.name] == 5
    end
    
    def run
        while !won_match?
            puts "=============New round==============="
            play_round
        end
        puts "=====#{previous_player.name} is the GHOST======="
        puts "#{current_player.name} wins the match!"
    end

end
    
if __FILE__ == $PROGRAM_NAME
    begin 
        puts "How many players do you have?"
        num_players = gets.chomp.to_i
        players = []
        dict = Set.new(File.readlines("dictionary.txt").map(&:chomp))
        (1..num_players).each do |num|
            puts "Please type the name of player #{num}"
            players << gets.chomp
        end
        
        Game.new(players, dict).run
    rescue ArgumentError
        puts "please type a valid num of players and names"
        retry
    end
end