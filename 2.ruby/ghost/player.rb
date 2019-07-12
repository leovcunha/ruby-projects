class Player
    def initialize(name)
        @name = name
    end
    
    attr_reader :name

    def guess
        puts "What is your guess?"
        gets.chomp
    end
end