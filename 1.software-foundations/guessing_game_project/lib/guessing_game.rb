class GuessingGame
    def initialize(min, max)
        @secret_num = rand(min..max)
        @num_attempts = 0
        @game_over = false
    end
    
    def num_attempts
        @num_attempts
    end
    
    def game_over?
        @game_over
    end
    
    def check_num(num)
        @num_attempts += 1
        @game_over = true if num == @secret_num
        puts 'you win!' if num == @secret_num
        puts 'too big...' if num > @secret_num
        puts 'too small...' if num < @secret_num
    end
    
    def ask_user
        puts 'enter a number:'
        guessed_num = gets.chomp.to_i
        check_num(guessed_num)
    end
    
    
end
