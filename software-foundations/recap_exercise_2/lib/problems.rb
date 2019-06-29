# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple 
# of both of the given numbers
def least_common_multiple(num_1, num_2)
    num_1.lcm(num_2)
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    count = Hash.new(0)
    (0...str.length).each do |i|
        count[str[i..i+1]] +=1
    end
    count.key(count.values.max)
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        h = Hash.new
        vals = self.values
        keys = self.keys
        vals.each_with_index {|v,i| h[v] = keys[i]}
        h
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        num_pairs =0
        self.each_with_index do |el, i| 
            (i...self.length).each do |j| 
                num_pairs += 1 if el + self[j] == num
            end
        end
        num_pairs
    end


    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    def bubble_sort(&prc)
        prc ||= Proc.new {|a,b| a <=> b}
        sorted = false
        while !sorted do
          sorted = true
          (self.length-1).times do |i| 
            if prc.call(self[i], self[i + 1]) == 1
              self[i], self[i + 1] = self[i + 1], self[i]
              sorted = false
            end
          end
        end
        self 
    end
end
