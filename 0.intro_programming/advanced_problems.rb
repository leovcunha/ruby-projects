def map_by_name(arr)
	return arr.map {|el| el["name"]}
end


pets = [
  {"type"=>"dog", "name"=>"Rolo"},
  {"type"=>"cat", "name"=>"Sunny"},
  {"type"=>"rat", "name"=>"Saki"},
  {"type"=>"dog", "name"=>"Finn"},
  {"type"=>"cat", "name"=>"Buffy"}
]
print map_by_name(pets) #=> ["Rolo", "Sunny", "Saki", "Finn", "Buffy"]
puts

countries = [
 {"name"=>"Japan", "continent"=>"Asia"},
 {"name"=>"Hungary", "continent"=>"Europe"},
 {"name"=>"Kenya", "continent"=>"Africa"},
]
print map_by_name(countries) #=> ["Japan", "Hungary", "Kenya"]
puts


def map_by_key(arr, key)
  return arr.map {|hash| hash[key]}

end

locations = [
  {"city"=>"New York City", "state"=>"New York", "coast"=>"East"},
  {"city"=>"San Francisco", "state"=>"California", "coast"=>"West"},
  {"city"=>"Portland", "state"=>"Oregon", "coast"=>"West"},
]

print map_by_key(locations, "state") #=> ["New York", "California", "Oregon"]
puts
print map_by_key(locations, "city") #=> ["New York City", "San Francisco", "Portland"]
puts


def yell_sentence(sent)
 return sent.split(" ").map {|w| w.upcase+"!"}.join(" ")
end

puts yell_sentence("I have a bad feeling about this") #=> "I! HAVE! A! BAD! FEELING! ABOUT! THIS!"

def whisper_words(words)
  return words.map {|w| w.downcase+"..."}
end

print whisper_words(["KEEP", "The", "NOISE", "down"]) # => ["keep...", "the...", "noise...", "down..."]
puts

def o_words(sentence)
   return sentence.split(" ").select {|w| w.include?("o")}
end

print o_words("How did you do that?") #=> ["How", "you", "do"]
puts

def last_index(str, char)
 return str.rindex(char)
end

puts last_index("abca", "a")       #=> 3
puts last_index("mississipi", "i") #=> 9
puts last_index("octagon", "o")    #=> 5
puts last_index("programming", "m")#=> 7


def most_vowels(sentence)
  vowels = 'aeiou'
  count={}
  sentarray = sentence.split
  sentarray.each_with_index do |w,i|
    cnt = 0
    w.each_char do |ch|
      if vowels.include?(ch) 
        cnt +=1
      end
    end
    count[w]=cnt
  end
  puts count.sort_by{|k,v| v}[-1][0]

end

print most_vowels("what a wonderful life") #=> "wonderful"


def prime?(num)
    if num < 0 
      return false
    end
    if num == 2
      return true
    end
	(2..num/2).each do |n|
      if num % n == 0
        return false
      end  
    end
    return true
    
end

puts prime?(2)  #=> true
puts prime?(5)  #=> true
puts prime?(11) #=> true
puts prime?(4)  #=> false
puts prime?(9)  #=> false
puts prime?(-5) #=> false


def pick_primes(numbers)
  numbers.select {|n| prime?(n)}
end

def prime_factors(num)
    factors = {} 
    if num <= 2 
      return [num]
    end
	(2..num/2).each do |n|
      if num % n == 0 && prime?(n)
        factors[n] = true
      end  
    end
    return factors.keys
  
end



print pick_primes([2, 3, 4, 5, 6]) #=> [2, 3, 5]
puts
print pick_primes([101, 20, 103, 2017]) #=> [101, 103, 2017]
puts


def greatest_factor_array(arr)
  return arr.map {|num| gfa(num)}
end

def gfa(num)
  if num % 2 == 0
   (1...num).reverse_each do |div|
      if num % div == 0
        return div
      end
    end
  else 
    return num
  end
end


print greatest_factor_array([16, 7, 9, 14]) # => [8, 7, 9, 7]
puts
print greatest_factor_array([30, 3, 24, 21, 10]) # => [15, 3, 12, 21, 5]
puts


def perfect_square?(num)
    (1..num).each do |factor|
    if factor * factor == num
      return true
    end
  end

  return false
end

puts perfect_square?(5)   #=> false
puts perfect_square?(12)  #=> false
puts perfect_square?(30)  #=> false
puts perfect_square?(9)   #=> true
puts perfect_square?(25)  #=> true

def triple_sequence(start, length)
  (0...length).map {|i| start*3**i}
end

print triple_sequence(2, 4) # => [2, 6, 18, 54]
puts
print triple_sequence(4, 5) # => [4, 12, 36, 108, 324]
puts

def summation_sequence(start, length)
	arr = []
    arr << start
    (1...length).each do |n|
      sum = 0
      (1..arr[-1]).each do |el|
        sum += el
      end
      arr << sum
    end
    return arr
end


print summation_sequence(3, 4) # => [3, 6, 21, 231]
print summation_sequence(5, 3) # => [5, 15, 120]

def fibonacci(length)
	fibos = [1, 1, 2, 3, 5, 8]
    if length <=6
      return fibos[0...length]
    end
  	(6..length).each do |n|
      fibos << fibos[n-2]+fibos[n-1]
    end
    return fibos[0...length]
    
end

print fibonacci(0) # => []
puts
print fibonacci(1) # => [1]
puts
print fibonacci(6) # => [1, 1, 2, 3, 5, 8]
puts
print fibonacci(8) # => [1, 1, 2, 3, 5, 8, 13, 21]
puts


# Feel free to use this variable:
# alphabet = "abcdefghijklmnopqrstuvwxyz"

def caesar_cipher(str, num)
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  return str.each_char.with_index {|ch,i| str[i]=alphabet[alphabet.index(ch)+num]}
end

puts caesar_cipher("apple", 1)    #=> "bqqmf"
puts caesar_cipher("bootcamp", 2) #=> "dqqvecor"
puts caesar_cipher("zebra", 4)    #=> "difve"


def vowel_cipher(string)
  vowels = "aeiou"
  return string.split("").map {|ch| vowels.include?(ch) ? vowels[(vowels.index(ch)+1) % 5] : ch}.join("")
end

puts vowel_cipher("bootcamp") #=> buutcemp
puts vowel_cipher("paper cup") #=> pepir cap


def double_letter_count(string)
  count=0
  string.each_char.with_index do |ch, i|
    if ch == string[i-1]
      count +=1
    end
  end
  return count

end

puts double_letter_count("the jeep rolled down the hill") #=> 3
puts double_letter_count("bootcamp") #=> 1


def adjacent_sum(arr)
  sum =[]
  arr.each_with_index do |el, i|
    if arr[i+1]
      sum << el + arr[i+1]
    end
  end
  return sum
end

print adjacent_sum([3, 7, 2, 11]) #=> [10, 9, 13], because [ 3+7, 7+2, 2+11 ]
puts
print adjacent_sum([2, 5, 1, 9, 2, 4]) #=> [7, 6, 10, 11, 6], because [2+5, 5+1, 1+9, 9+2, 2+4]
puts

 For example, the base [1, 4, 6] gives us the following pyramid
#     15
#   5   10
# 1   4    6

def pyramid_sum(base)
  pyramid = [base]
  while pyramid.length < base.length
    prev_level = pyramid[0]
    next_level = adjacent_sum(prev_level)
    pyramid.unshift(next_level)
  end

  return pyramid
end



print pyramid_sum([1, 4, 6]) #=> [[15], [5, 10], [1, 4, 6]]
puts

print pyramid_sum([3, 7, 2, 11]) #=> [[41], [19, 22], [10, 9, 13], [3, 7, 2, 11]]
puts

def all_else_equal(arr)
  sum = sum_array(arr)

  arr.each do |ele|
    if ele == sum / 2.0
      return ele
    end
  end

  return nil
end

def sum_array(arr)
  sum = 0

  arr.each do |num|
    sum += num
  end

  return sum
end


p all_else_equal([2, 4, 3, 10, 1]) #=> 10, because the sum of all elements is 20
p all_else_equal([6, 3, 5, -9, 1]) #=> 3, because the sum of all elements is 6
p all_else_equal([1, 2, 3, 4])     #=> nil, because the sum of all elements is 10 and there is no 5 in the array


def anagrams?(word1, word2)
  count1 = Hash.new(0)
  count2 = Hash.new(0)
  word1.each_char {|el| count1[el] += 1}
  word2.each_char {|el| count2[el] += 1}
  return count1.sort == count2.sort
end

puts anagrams?("cat", "act")          #=> true
puts anagrams?("restful", "fluster")  #=> true
puts anagrams?("cat", "dog")          #=> false
puts anagrams?("boot", "bootcamp")    #=> false

def consonant_cancel(sentence)
  words = sentence.split
  new_words = words.map { |word| remove_first_consonant(word) }
  return new_words.join(" ")
end

def remove_first_consonant(word)
  vowels = "aeiou"
  word.each_char.with_index do |char, i|
    if vowels.include?(char)
      return word[i..-1]
    end
  end
end
puts consonant_cancel("down the rabbit hole") #=> "own e abbit ole"
puts consonant_cancel("writing code is challenging") #=> "iting ode is allenging"


def same_char_collapse(str)
  count1 = Hash.new(0)
  str.each_char {|el| count1[el] += 1}
  selected = count1.select {|k,v| v % 2 != 0}  #=> {"a" => 100}
  return selected.keys.join("")

end

puts same_char_collapse("zzzxaaxy")   #=> "zy"
# because zzzxaaxy -> zxaaxy -> zxxy -> zy


puts same_char_collapse("uqrssrqvtt") #=> "uv"
# because uqrssrqvtt -> uqrrqvtt -> uqqvtt -> uvtt -> uv