# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
def is_prime?(num)
  return if num <= 1
  (2..Math.sqrt(num)).none? { |i| (num % i).zero? }
end

def largest_prime_factor(num)
    num.downto(2) do |f|
        return f if num % f == 0 && is_prime?(f)
    end
end

def unique_chars?(str)
    sorted = str.split("").sort
    sorted.each_with_index {|c,i| return false if c == sorted[i+1] }
    true
end

def dupe_indices(arr)
    h = Hash.new {|h,k| h[k]=[]}
    arr.each_with_index do |el, i|
        h[el] << i
    end
    h.select {|k,v| v.length > 1}
end

def ana_array(arr1, arr2)
    count1 = Hash.new(0)
    count2 = Hash.new(0)
    arr1.each {|el| count1[el] +=1 }
    arr2.each {|el| count2[el] +=1 }
    count1 == count2
end