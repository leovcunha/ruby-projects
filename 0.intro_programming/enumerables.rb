def to_initials(name)
	arr = name.split(" ")
    inits = ""
    arr.each {|name| inits << name[0]}
    return inits
end

puts to_initials("Kelvin Bridges")      # => "KB"
puts to_initials("Michaela Yamamoto")   # => "MY"
puts to_initials("Mary La Grange")      # => "MLG"


def first_in_array(arr, el1, el2)
  arr.each do |item|
    if item == el1
      return el1
    elsif item == el2
      return el2
    end
  end
end

puts first_in_array(["a", "b", "c", "d"], "d", "b"); # => "b"
puts first_in_array(["cat", "bird" ,"dog", "mouse" ], "dog", "mouse"); # => "dog"


def abbreviate_sentence(sent)
	arr = sent.split(" ")
    result = []

    arr.each do |el|
      edit = ""
      if el.length <= 4
        result << el
      else
        el.each_char do |ch|
          if ch != 'a' && ch != 'e' && ch !='i' && ch != 'o' && ch != 'u'
            edit = edit + ch
          end
        end
        result << edit
      end
    end
    return result.join(" ")
      
        
end

puts abbreviate_sentence("follow the yellow brick road") # => "fllw the yllw brck road"
puts abbreviate_sentence("what a wonderful life")        # => "what a wndrfl life"


# Hint: use str.upcase and str.downcase
# "abc".upcase # => "ABC"

def format_name(str)
 return str.downcase.split(" ").each {|word| word[0] = word[0].upcase }.join(" ")
end

puts format_name("chase WILSON") # => "Chase Wilson"
puts format_name("brian CrAwFoRd scoTT") # => "Brian Crawford Scott"


# A name is valid is if satisfies all of the following:
# - contains at least a first name and last name, separated by spaces
# - each part of the name should be capitalized
#
# Hint: use str.upcase or str.downcase
# "a".upcase # => "A"

def is_valid_name(str)
	s = str.split(" ")
    if s.length < 2
      return false
    end
    sUP = str.upcase.split(" ")
    sDown = str.downcase.split(" ")
    if s == sUP || s == sDown 
      return false
    end
    s.each_with_index do |word, i|
      if word[0] != sUP[i][0] || word[1..-1] != sDown[i][1..-1]
        return false
      end
    end
    return true
end

puts is_valid_name("Kush Patel")       # => true
puts is_valid_name("Daniel")           # => false
puts is_valid_name("Robert Downey Jr") # => true
puts is_valid_name("ROBERT DOWNEY JR") # => false


# For simplicity, we'll consider an email valid when it satisfies all of the following:
# - contains exactly one @ symbol
# - contains only lowercase alphabetic letters before the @
# - contains exactly one . after the @

def is_valid_email(str)
  parts = str.split("@")

  if parts.length != 2
    return false
  end

  first = parts[0]
  second = parts[1]
  alpha = "abcdefghijklmnopqrstuvwxyz"

  first.each_char do |char|
    if !alpha.include?(char)
      return false
    end
  end

  if second.split('.').length == 2
    return true
  else
    return false
  end
end

puts is_valid_email("abc@xy.z")         # => true
puts is_valid_email("jdoe@gmail.com")   # => true
puts is_valid_email("jdoe@g@mail.com")  # => false
puts is_valid_email("jdoe42@gmail.com") # => false
puts is_valid_email("jdoegmail.com")    # => false
puts is_valid_email("az@email")         # => false


ef array_translate(array)
 result = ""
 array.length/2.times do 
   result = result + array.shift()*array.shift()
 end
 return result
end

print array_translate(["Cat", 2, "Dog", 3, "Mouse", 1]); # => "CatCatDogDogDogMouse"
puts

print array_translate(["red", 3, "blue", 1]); # => "redredredblue"
puts


def reverse_words(sent)
    reversed = []
	sent.split(" ").each {|word| reversed << word.reverse}
    return reversed.join(" ")
end

puts reverse_words('keep coding') # => 'peek gnidoc'
puts reverse_words('simplicity is prerequisite for reliability') # => 'yticilpmis si etisiuqererp rof ytilibailer'


def rotate_array(arr, num)
  num.times do 
    arr.unshift(arr.pop())
  end
  return arr
end

print rotate_array([ "Matt", "Danny", "Mashu", "Matthias" ], 1) # => [ "Matthias", "Matt", "Danny", "Mashu" ]
puts

print rotate_array([ "a", "b", "c", "d" ], 2) # => [ "c", "d", "a", "b" ]
puts


# Pig latin translation uses the following rules:
# - for words that start with a vowel, add 'yay' to the end
# - for words that start with a nonvowel, move all letters before the first vowel to the end of the word and add 'ay'

def pig_latin_word(word)
  vowels = 'aeiou'
  weird = word
  shifted = false
  weird.each_char do |ch|
    if vowels.include?(ch) && !shifted
        return weird + 'yay'
    elsif vowels.include?(ch) && shifted
        return weird + 'ay'
    else
    	vec = weird.split("")
        weird = vec.push(vec.shift()).join("")
        shifted = true
    end
    
  end
  	
    
end

puts pig_latin_word("apple")   # => "appleyay"
puts pig_latin_word("eat")     # => "eatyay"
puts pig_latin_word("banana")  # => "ananabay"
puts pig_latin_word("trash")   # => "ashtray"


def combinations(arr)
 combs = []
 arr.each_with_index do |el1,i|
   arr.each_with_index do |el2,j|
     if j <= i
       next
     end
     combs << [el1, el2]
   end
 end
 return combs
     
end

print combinations(["a", "b", "c"]); # => [ [ "a", "b" ], [ "a", "c" ], [ "b", "c" ] ]
puts

print combinations([0, 1, 2, 3]); # => [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 1, 2 ], [ 1, 3 ], [ 2, 3 ] ]
puts


def opposite_count(nums)
	count = 0
	nums.each_with_index do |el1,i|
		nums.each_with_index do |el2,j|
     		if j <= i
        		next
     		end
     		if el1+el2 == 0
      			count +=1
      		end
    	end
	end 
	return count        
end

puts opposite_count([ 2, 5, 11, -5, -2, 7 ]) # => 2
puts opposite_count([ 21, -23, 24 -12, 23 ]) # => 1


def two_d_sum(arr)
	sum = 0
	arr.each_with_index do |subarr,i|
		subarr.each_with_index do |el,j|
      		sum += el
    	end
	end 
	return sum   
end

array_1 = [
  [4, 5],
  [1, 3, 7, 1]
]
puts two_d_sum(array_1)    # => 21

array_2 = [
  [3, 3],
  [2],
  [2, 5]
]
puts two_d_sum(array_2)    # => 15


def two_d_translate(arr)
	translated = []
	arr.each do |subarr|
        subarr[1].times do
			translated << subarr[0]
    	end
	end 
	return translated   
end

arr_1 = [
  ['boot', 3],
  ['camp', 2],
  ['program', 0]
]

print two_d_translate(arr_1) # => [ 'boot', 'boot', 'boot', 'camp', 'camp' ]
puts

arr_2 = [
  ['red', 1],
  ['blue', 4]
]

print two_d_translate(arr_2) # => [ 'red', 'blue', 'blue', 'blue', 'blue' ]
puts