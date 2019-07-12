def count_e(word)
	i=0
  	num_e=0
  	while i < word.length
  		if word[i] == 'e'
          num_e+=1
        end
        i += 1
    end
    return num_e
end

puts count_e("movie") # => 1
puts count_e("excellent") # => 3

def count_a(word)
	i=0
  	num_a=0
  	while i < word.length
  		if word[i] == 'a' || word[i] == 'A'
          num_a += 1
        end
        i += 1
    end
    return num_a
  
end

puts count_a("application")  # => 2
puts count_a("bike")         # => 0
puts count_a("Arthur")       # => 1
puts count_a("Aardvark")     # => 3


def count_vowels(word)
	i=0
  	num_vowels=0
  	while i < word.length
  		if word[i] == 'a' || word[i] == 'e' || word[i] == 'i' || word[i] == 'o' ||  word[i] == 'u'
          num_vowels += 1
        end
        i += 1
    end
    return num_vowels
end

puts count_vowels("bootcamp")  # => 3
puts count_vowels("apple")     # => 2
puts count_vowels("pizza")     # => 2

def sum_nums(max)
    i = 1
    sum = 0
	while i <= max 
      sum += i
      i += 1
    end
    return sum
      
end

puts sum_nums(4) # => 10, because 1 + 2 + 3 + 4 = 10
puts sum_nums(5) # => 15

def factorial(num)
	fact = 1
  	i = 1
  	while i <= num
      fact *= i
      i += 1
    end
    return fact
end

puts factorial(3) # => 6, because 1 * 2 * 3 = 6
puts factorial(5) # => 120, because 1 * 2 * 3 * 4 * 5 = 120


def reverse(word)
	i = word.length-1
    reversed = ""
    
    while i >= 0
      reversed += word[i]  
      i -= 1
    end
    return reversed
      
end

puts reverse("cat")          # => "tac"
puts reverse("programming")  # => "gnimmargorp"
puts reverse("bootcamp")     # => "pmactoob"

def is_palindrome(word)
	i = word.length-1
    j = 0
    
    while j <= word.length/2
      if word[i] != word[j]
        return false
      end
      i -= 1
      j += 1
    end      
    return true
      
end