def average(a, b)
    (a+b)/2.0
end

def average_array(array)
    puts array
    array.inject{ |sum, el| sum + el }.to_f / array.size
end
average_array([11, 5, 13, 2, 3])
def repeat(str,num)
    str*num
end

def yell(str)
    str.upcase + "!"
end

def alternating_case(str)
    str.split(" ").map.with_index {|w,i| i % 2 ==0 ? w.upcase : w.downcase }.join(" ")
end

puts alternating_case("code never lies, comments sometimes do.")