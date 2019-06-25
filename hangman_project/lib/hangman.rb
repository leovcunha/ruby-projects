class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  def self.random_word
      DICTIONARY.sample
  end
  
  def initialize(word=Hangman.random_word)
      @secret_word = word
      @guess_word = Array.new(@secret_word.length, "_")
      @attempted_chars = []
      @remaining_incorrect_guesses = 5
  end
  
  def guess_word
      @guess_word
  end
  
  def attempted_chars
      @attempted_chars
  end
  
  def remaining_incorrect_guesses
      @remaining_incorrect_guesses
  end
  
  def already_attempted?(char)
      @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    indices = []
    @secret_word.each_char.with_index do |curr_char, i|
      indices << i if curr_char == char
    end
    indices
  end
  
  def fill_indices(char, idxes)
      idxes.each {|i| @guess_word[i] = char}
  end
  
  def try_guess(c)
      if already_attempted?(c)
          puts 'that was already attempted' 
          return false
      end
      @attempted_chars << c
      matches = get_matching_indices(c)
      @remaining_incorrect_guesses -= 1 if matches.empty? 
      fill_indices(c, matches)
      true
  end
  
  def ask_user_for_guess
      puts "Enter a char:"
      guess = gets.chomp
      try_guess(guess)
  end

  def win?
      if @guess_word.join("") == @secret_word
        puts "WIN"
        return true
      end
      false
  end

  def lose?
      if @remaining_incorrect_guesses == 0
        puts "LOSE"
        return true
      end
      false
  end

  def game_over?
      if !(win? || lose?)
          return false 
      end
      puts @secret_word
      true
  end
end
