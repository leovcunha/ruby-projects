def hipsterfy(word)
    word.slice!(word.rindex(/[aeiou]/)) if word.rindex(/[aeiou]/)
    word
end

def vowel_counts(str)
    hash= Hash.new(0)
    str.downcase.each_char {|c| hash[c] +=1}
    hash
end

def caesar_cipher(str,num)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    str.each_char.with_index do |ch,i|
        if /[[:alpha:]]/.match(str[i])
            newalpha = alphabet.index(ch)+num
            newalpha = newalpha % 26 if newalpha > 25
            str[i]=alphabet[newalpha]
        end
    end
    str
end
puts caesar_cipher("zebra", 4)