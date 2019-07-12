def doubler(numbers)
    double = []
    i = 0
	while i < numbers.length
      double << numbers[i]*2
      i += 1
    end
    return double
end

print doubler([1, 2, 3, 4]) # => [2, 4, 6, 8]
puts
print doubler([7, 1, 8])    # => [14, 2, 16]

def yell(words)
    yells = []
    i = 0
	while i < words.length
      yells << words[i] + "!"
      i += 1
    end
    return yells
end

print yell(["hello", "world"]) # => ["hello!", "world!"]
puts
print yell(["code", "is", "cool"]) # => ["code!", "is!", "cool!"]

def element_times_index(numbers)
    multiplies = []
    i = 0
	while i < numbers.length
      multiplies << numbers[i]*i
      i += 1
    end
    return multiplies
end

print element_times_index([4, 7, 6, 5])       # => [0, 7, 12, 15]
puts
print element_times_index([1, 1, 1, 1, 1, 1]) # => [0, 1, 2, 3, 4, 5]

def even_nums(max)
    evens = []
    i = 0
	while i <= max/2
      evens << i*2
      i += 1
    end
    return evens
end

print even_nums(100) # => [0, 2, 4, 6, 8, 10]
puts
print even_nums(5)  # => [0, 2, 4]

def range(min, max)
    numbersIn = []
    i = min
	while i <= max
      numbersIn << i
      i += 1
    end
    return numbersIn
end

print range(2, 7)   # => [2, 3, 4, 5, 6, 7]
puts
print range(13, 20) # => [13, 14, 15, 16, 17, 18, 19, 20]

def odd_range(min, max)
    odds = []
    i = min
	while i <= max
	  if(i % 2 != 0)
        odds << i
      end 
      i += 1
    end
    return odds
end

print odd_range(11, 18) # => [11, 13, 15, 17]
puts
print odd_range(3, 7)   # => [3, 5, 7]

def reverse_range(min, max)
    reversed = []
    i = max-1
	while i > min
      reversed << i
      i -= 1
    end
    return reversed
end

print reverse_range(10, 17) # => [16, 15, 14, 13, 12, 11]
puts
print reverse_range(1, 7)   # => [6, 5, 4, 3, 2]


def first_half(array)
    itens = []
    i = 0
	while i < array.length/2.0
      itens << array[i]
      i += 1
    end
    return itens
end

print first_half(["Brian", "Abby", "David", "Ommi"]) # => ["Brian", "Abby"]
puts 5/2.0
print first_half(["a", "b", "c", "d", "e"])          # => ["a", "b", "c"]

def factors_of(num)
    itens = []
    i = 1
	while i <= num/2.0
      if (num % i == 0)
        itens << i
      end
      i += 1
    end
    itens << num
    return itens
end

print factors_of(3)   # => [1, 3]
puts
print factors_of(4)   # => [1, 2, 4]
puts
print factors_of(8)   # => [1, 2, 4, 8]
puts
print factors_of(9)   # => [1, 3, 9]
puts
print factors_of(16)  # => [1, 2, 4, 8, 16]
puts
print factors_of(360)


def select_odds(numbers)
    itens = []
    i = 0
	while i < numbers.length
      if (numbers[i] % 2 != 0)
        itens << numbers[i]
      end
      i += 1
    end
    return itens
end

print select_odds([13, 4, 3, 7, 6, 11]) # => [13, 3, 7, 11]
puts
print select_odds([2, 4, 6])            # => []


def select_long_words(words)
    itens = []
    i = 1
	while i < words.length
      if (words[i].length > 4)
        itens << words[i]
      end
      i += 1
    end
    return itens
end

print select_long_words(["what", "are", "we", "eating", "for", "dinner"]) # => ["eating", "dinner"]
puts
print select_long_words(["keep", "coding"])                               # => ["coding"]


def sum_elements(arr1, arr2)
    itens = []
    i = 0
	while i < arr1.length
      itens << arr1[i]+arr2[i]
      i += 1
    end
    return itens
end

print sum_elements([7, 4, 4], [3, 2, 11])                            # => [10, 6, 15]
puts
print sum_elements(["cat", "pizza", "boot"], ["dog", "pie", "camp"]) # => ["catdog", "pizzapie", "bootcamp"]


def fizz_buzz(max)
	itens = []
    i = 1
	while i <= max/4
      if (i*4 % 6 != 0) && (i*4 < max)
        itens << i*4
      end
      if (i*6 % 4 != 0) && (i*6 < max)
        itens << i*6
      end
      i = i+1
    end
    return itens
end

print fizz_buzz(20) # => [4, 6, 8, 16, 18]
puts
print fizz_buzz(15) # => [4, 6, 8]
puts
print fizz_buzz(50) 