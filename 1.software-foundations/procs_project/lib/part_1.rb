def my_map(arr, &prc)
    newarr = []
    arr.each {|el| newarr << prc.call(el)}
    newarr
end

def my_select(arr, &prc)
    newarr = []
    arr.each {|el| newarr << el if prc.call(el)}
    newarr
end

def my_count(arr, &prc)
    count = 0
    arr.each {|el| count += 1 if prc.call(el)}
    count
end

def my_any?(arr, &prc)
    any = false
    arr.each {|el| any = true if prc.call(el)}
    any
end

def my_all?(arr, &prc)
    all = true
    arr.each {|el| all = false if !prc.call(el)}
    all
end

def my_none?(arr, &prc)
    none = true
    arr.each {|el| none = false if prc.call(el)}
    none
end