def palindrome?(word)
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

def substrings(str)
    arr = []
    (0...str.length).each do |i|
       (0...str.length).each do |j|
          if j >= i
            arr << str[i..j]
          end
       end
    end
    arr
end

def palindrome_substrings(str)
   arr = substrings(str)
   arr.select {|el| el.length > 1 ? palindrome?(el) : false}
end