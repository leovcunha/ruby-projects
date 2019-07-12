def get_double_age(hash)
	return hash["age"]*2
end

puts get_double_age({"name"=>"App Academy", "age"=>5}) # => 10
puts get_double_age({"name"=>"Ruby", "age"=>23})       # => 46

def get_full_name(hash)
  return hash.values[0..1].join(" ") + ", the " + hash["title"]
end

hash1 = {"first"=>"Michael", "last"=>"Jordan", "title"=> "GOAT"}
puts get_full_name(hash1) # => "Michael Jordan, the GOAT"

hash2 = {"first"=>"Fido", "last"=>"McDog", "title"=> "Loyal"}
puts get_full_name(hash2) # => "Fido McDog, the Loyal"


def word_lengths(sentence)
  hassh = Hash.new(0)
  sentence.split(" ").each {|w| hassh[w] = w.length }
  return hassh
end

puts word_lengths("this is fun") #=> {"this"=>4, "is"=>2, "fun"=>3}
puts word_lengths("When in doubt, leave it out") #=> {"When"=>4, "in"=>2, "doubt,"=>6, "leave"=>5, "it"=>2, "out"=>3}


def retrieve_values(hash1, hash2, key)
	arr = []
    arr << hash1[key]
    arr << hash2[key]
    return arr
end


dog1 = {"name"=>"Fido", "color"=>"brown"}
dog2 = {"name"=>"Spot", "color"=> "white"}
print retrieve_values(dog1, dog2, "name") #=> ["Fido", "Spot"]
puts
print retrieve_values(dog1, dog2, "color") #=> ["brown", "white"]
puts


def cat_builder(name_str, color_str, age_num)
	return {"name" => name_str, 
           "color" => color_str, 
             "age" => age_num}
end

print cat_builder("Whiskers", "orange", 3) #=> {"name"=>"Whiskers", "color"=>"orange", "age"=>3}
puts

print cat_builder("Salem", "black", 100) #=> {"name"=>"Salem", "color"=>"black", "age"=>100}
puts


def ae_count(str)
  count = Hash.new(0)
  str.each_char do |ch| 
    if ch == 'a' || ch == 'e'
      count[ch] += 1
    end
  end
  return count
end

puts ae_count("everyone can program") #=> {"a"=>2, "e"=>3}
puts ae_count("keyboard") #=> {"a"=>1, "e"=>1}


def element_count(arr)
  count = Hash.new(0)
  arr.each {|el| count[el] += 1}
  return count
end

puts element_count(["a", "b", "a", "a", "b"]) #=> {"a"=>3, "b"=>2}
puts element_count(["red", "red", "blue", "green"]) #=> {"red"=>2, "blue"=>1, "green"=>1}


def select_upcase_keys(hash)
  select = {}
  hash.each_key do |key| 
    if key == key.upcase
      select[key] = hash[key]
    end
  end
  return select
end

print select_upcase_keys({"make"=> "Tesla", "MODEL"=> "S", "Year"=> 2018, "SEATS"=> 4}) # => {"MODEL"=>"S", "SEATS"=>4}
puts

print select_upcase_keys({"DATE"=>"July 4th","holiday"=> "Independence Day", "type"=>"Federal"}) # => {"DATE"=>"July 4th"}
puts


def hand_score(hand)
  vals = {"a"=>4, "k"=>3, "q"=>2, "j"=>1 }
  sum =0
  hand.each_char{|ch| sum += vals[ch.downcase]}
  return sum
end

puts hand_score("AQAJ") #=> 11
puts hand_score("jJka") #=> 9


def frequent_letters(string)
  count = Hash.new(0)
  filter = []
  string.each_char {|el| count[el] += 1}
  count.each do |k,v|
    if v> 2
      filter << k
    end
  end
  return filter
  
end

print frequent_letters('mississippi') #=> ["i", "s"]
puts
print frequent_letters('bootcamp') #=> []
puts


def hash_to_pairs(hash)
  pairs = []
  hash.each{|k,v| pairs << [k,v]}
  return pairs
end


print hash_to_pairs({"name"=>"skateboard", "wheels"=>4, "weight"=>"7.5 lbs"}) #=> [["name", "skateboard"], ["wheels", 4], ["weight", "7.5 lbs"]]
puts


print hash_to_pairs({"kingdom"=>"animalia", "genus"=>"canis", "breed"=>"German Shepherd"}) #=> [["kingdom", "animalia"], ["genus", "canis"], ["breed", "German Shepherd"]]
puts

# Hint: all keys of a hash are automatically unique

def unique_elements(arr)
  hash = Hash.new(0)
  arr.each {|el| hash[el] += 1}
  return hash.keys

end

print unique_elements(['a', 'b', 'a', 'a', 'b', 'c']) #=> ["a", "b", "c"]
puts


def element_replace(arr, hash)
  replaced = arr
  arr.each_with_index do |el, i| 
    if hash[el] 
      replaced[i]=hash[el]
    end
  end
  return replaced
end

arr1 = ["LeBron James", "Lionel Messi", "Serena Williams"]
hash1 = {"Serena Williams"=>"tennis", "LeBron James"=>"basketball"}
print element_replace(arr1, hash1) # => ["basketball", "Lionel Messi", "tennis"]
puts

arr2 = ["dog", "cat", "mouse"]
hash2 = {"dog"=>"bork", "cat"=>"meow", "duck"=>"quack"}
print element_replace(arr2, hash2) # => ["bork", "meow", "mouse"]
puts