def select_even_nums(arr)
    arr.select(&:even?)
end

def reject_puppies(hsh)
    hsh.reject {|dog| dog["age"] <= 2}
    
end

def count_positive_subarrays(arr)
    arr.count {|el| el.sum > 0}
    
end

def aba_translate(str)
    abaword = ""
    str.each_char {|c| 'aeiou'.include?(c) ? abaword << c+"b"+c : abaword << c}
    abaword
end

def aba_array(arr)
    arr.map {|w| aba_translate(w)}
end