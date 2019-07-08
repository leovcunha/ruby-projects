  #sum_to(5)  # => returns 15
  #sum_to(1)  # => returns 1
  #sum_to(9)  # => returns 45
  #sum_to(-8)  # => returns nil
require "byebug"

def sum_to(n)
    return nil if n < 0 
    return n if n == 0 || n == 1
    n + sum_to(n-1)
end

  # Test Cases
#  add_numbers([1,2,3,4]) # => returns 10
#  add_numbers([3]) # => returns 3
#  add_numbers([-80,34,7]) # => returns -39
#  add_numbers([]) # => returns nil
def add_numbers(arr)
    return nil if arr == []
    return arr[0] if arr.length == 1
    arr[0] + add_numbers(arr[1..-1])
end

# Test Cases
#  gamma_fnc(0)  # => returns nil
#  gamma_fnc(1)  # => returns 1
#  gamma_fnc(4)  # => returns 6
#  gamma_fnc(8)  # => returns 5040

def gamma_fnc(n)
  return nil if n == 0
  return 1 if n == 1
  (n - 1) * gamma_fnc(n - 1)
end

puts "gamma_func tests"
p gamma_fnc(0)
p gamma_fnc(1)
p gamma_fnc(4)
p gamma_fnc(8)

  # Test Cases
def ice_cream_shop(arr, flavor) 
    return false if arr.empty?
    return true if arr.first == flavor
    ice_cream_shop(arr[1..-1], flavor)
end

puts "icecream shop tests"  
p ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
p ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
p ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
p ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
p ice_cream_shop([], 'honey lavender')  # => returns false

def reverse(str)
    return str if str.length <= 1
    str[-1] + reverse(str[0..-2])
end

puts "reverse tests:"  
p reverse("house") # => "esuoh"
p reverse("dog") # => "god"
p reverse("atom") # => "mota"
p reverse("q") # => "q"
p reverse("id") # => "di"
p reverse("") # => ""

def range(start_val, end_val)
  return [] if (end_val <= start_val)
  [start_val] + range(start_val+1, end_val)
end

#Note that for recursion 2, you will need to square the results of exp(b, n / 2)
#and (exp(b, (n - 1) / 2). Remember that you don't need to do anything special to square a 
#number, just calculate the value and multiply it by itself. So don't cheat and use exponentiation in your solution
# recursion 2
#exp(b, 0) = 1
#exp(b, 1) = b
#exp(b, n) = exp(b, n / 2) ** 2             [for even n]
#exp(b, n) = b * (exp(b, (n - 1) / 2) ** 2) [for odd n]
def exp_1(base, exponent)
    return 1 if exponent == 0    
    base * exp_1(base, exponent-1)
end
puts "test cases exp_1"
p exp_1(9,2)
p exp_1(3,4)
p exp_1(-2, 5)
p exp_1(-2, 4)

def exp_2(base, exponent)
    return 1 if exponent == 0
    return base if exponent == 1
    exponent.even? ? exp_2(base, exponent/2) ** 2 : base * exp_2(base, (exponent-1)/2)**2
end
puts "test cases exp_2"
p exp_2(4,3)
p exp_2(2,6)
p exp_2(-3, 6)
p exp_2(-9, 3)

class Array
  def deep_dup
    return [] if self.length == 0
    dup_arr = []
    self.each {|el| el.is_a?(Array) ? dup_arr << el.deep_dup : dup_arr << el }
    dup_arr
  end

  def self.fib_recur(n)
    return [] if n == 0
    return [0] if n == 1
    return [0, 1] if n == 2
    result = []
    result += fib_recur(n - 1)
    result << result[-1] + result[-2]
    result
  end
  
  def self.bsearch(array, target)
    middle = array.size / 2
    lower = array[0...middle]
    upper = array[middle..- 1]
  
    if array[middle] == target
      middle
    elsif array[middle] > target # if in lower, return idx
      bsearch(lower, target)
    elsif array[middle] < target # if in uppper, return idx + middle
      bsearch(upper, target) + middle
    else
      nil
    end
  end # bsearch
  
  def merge_sort
    return self if self.size == 1
    middle = self.size / 2
    lower = self[0...middle].merge_sort
    upper = self[middle..- 1].merge_sort
    Array.merge(lower, upper)
    
  end

  def self.merge(arr1, arr2)
    result = []
    loop do  
      if arr1.empty? && !arr2.empty?
        result << arr2.shift
      elsif arr2.empty? && !arr1.empty?
        result << arr1.shift
      else
        arr1.first <= arr2.first ? result << arr1.shift : result << arr2.shift
      end
      break if arr1.empty? && arr2.empty?
    end
    result
  end 
  
  def subsets
    return [[]] if self.length == 0
    lower = self[0...-1].subsets
    upper =lower.map {|el| el + [self.last]}
    lower + upper
  end
  
end


at = [2, 4, 1, 5, 6, 8, 3, 7, 9, 10]

x = [1, [2], [3, [4]]]
p x.deep_dup
puts "Fibonacci:"
p Array.fib_recur(10)
puts "Merge sort"
p at.merge_sort
puts "Subsets:"
p at.subsets