def partition(arr, num)
    ret1 = arr.select {|el| el<num} 
    ret2= arr.select {|el| el >=num}
    ret = [ret1, ret2]
end

def merge(h1, h2)
    h = Hash.new
    h1.map { |k,v| h[k]=v}
    h2.map { |k,v| h[k]=v}
    h
end

def censor(str, arr)
    vowels = 'aeiou'
    edited = str.split(" ").map do |k|
        if arr.include?(k.downcase)
            k.each_char.with_index {|c,i| k[i]='*' if vowels.include?(c.downcase)}
        end
        k
    end
    edited.join(" ")
end

def power_of_two?(n)
    x = n
    while x % 2 == 0
        x = x/2
    end
    x == 1
end