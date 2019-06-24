def all_words_capitalized?(arr)
    arr.all? {|word| word[0] == word[0].upcase && word[1..-1] == word[1..-1].downcase}
end

def no_valid_url?(urls)
    urls.none? {|u| u.match?(/\.(com|org|io|net)/)}
end

def any_passing_students?(arr)
    arr.any? do |student| 
        student[:grades].inject{ |sum, el| sum + el } / student[:grades].length * 1.0 >= 75
    end
end