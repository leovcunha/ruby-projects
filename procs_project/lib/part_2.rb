def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(str, &prc)
    str.split(" ").map {|w| prc.call(w)}.join(" ")
end

def greater_proc_value(num, prc1, prc2)
    res1 = prc1.call(num)
    res2 = prc2.call(num)
    res1>res2 ? res1 : res2
end

def and_selector(arr, prc1, prc2)
    newarr = []
    arr.each do |el|
        newarr << el if prc1.call(el) && prc2.call(el)
    end
    newarr
end

def alternating_mapper(arr, prc1, prc2)
    newarr = []
    arr.each_with_index do |el,i|
        i.even? ? newarr << prc1.call(el) : newarr << prc2.call(el)
    end
    newarr
end