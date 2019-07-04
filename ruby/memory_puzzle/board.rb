#The Board is responsible for keeping track of all your Cards. You'll want a grid 
#instance variable to contain Cards. Useful methods:

#populate should fill the board with a set of shuffled Card pairs
#render should print out a representation of the Board's current state
#won? should return true if all cards have been revealed.
#reveal should reveal a Card at guessed_pos (unless it's already face-up, in which 
#case the method should do nothing). It should also return the value of the card it #
#revealed (you'll see why later).
require_relative "card.rb"

class Board
    def initialize(rows, cols)
        @grid = Array.new(rows) {Array.new(cols)}
        @rows = rows
        @cols = cols
    end
    
    attr_reader :rows, :cols, :grid
    
    def [](*pos)
        row, col = pos
        @grid[row][col]
    end
    
    def []=(*pos, value)
        row, col = pos
        @grid[row][col] = value
    end
    
    def populate
        array = []
        letters = ("A".."Z").to_a.shuffle!
        num_pairs = rows * cols / 2
        num_pairs.times do 
            card_val = letters.shift
            2.times { array << card_val }
        end
        array.shuffle!
        array.shuffle!
        cards = array.map {|val| Card.new(val)}
        (0...rows).each do |row|
            (0...cols).each do |col|
                @grid[row][col] = cards.pop
            end
        end
    end
    
    def render
        
    end

    def won?
        grid.all? { |row| row.all? {|card| card.face_up }}
    end    
    
    def reveal(*guessed_pos)
        row, col = guessed_pos
        grid[row][col].flip unless grid[row][col].face_up
        grid[row][col].display
    end

  def render
    system("clear")
    print("  ")
    (0...cols).each {|el| print el.to_s+" "} 
    puts
    grid.each_with_index do |row,i| 
        print i.to_s + " "
        puts row.map {|card| card.display}.join(" ")
    end  
    true
  end
  
end