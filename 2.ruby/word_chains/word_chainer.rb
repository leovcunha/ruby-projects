
class WordChainer
    def initialize(dic_filename)
        @dictionary = File.read(dic_filename)
    end
    
    def adjacent_words(word)
        ra = WordChainer.regex_array(word)
        adjacents = []
        ra.each {|pattern| adjacents += @dictionary.scan(pattern)}
        adjacents.map(&:strip)
    end
    
    def self.regex_array(word)
        ra = []
        (0...word.length).each do |i|
            changed = word.dup; changed[i] = "[a-z&&[^#{changed[i]}]]{1}"
            changed << "\n"; changed.prepend("\n")
            ra << Regexp.new(changed)
        end
        ra
    end  
    
    
    def run(source, target)
        @current_words = [source]
        @all_seen_words = {source => nil}
        
        until @current_words.empty? do
            @current_words = self.explore_current_words(target)
        end
        build_path(target)
    end
    
    def explore_current_words(target)
        new_current_words = []
        @current_words.each do |current_word|
            adjacent_words = self.adjacent_words(current_word)
            adjacent_words.each do |adjacent_word|
                next if @all_seen_words.include?(adjacent_word) 
                new_current_words << adjacent_word
                @all_seen_words[adjacent_word] = current_word
                #new_current_words.each {|w| p "#{w} <= #{@all_seen_words[w]} "}
                return new_current_words if @all_seen_words.keys.include?(target)
            end
        end
        
        new_current_words
    end
    
    def build_path(target)
        path = [target]
        until @all_seen_words[path.first] == nil do 
            path.unshift(@all_seen_words[path.first])
        end
        path
    end
    
end

if __FILE__ == $PROGRAM_NAME
  x = WordChainer.new("dictionary.txt")
  puts "duck to ruby:"
  p x.run("duck", "ruby")
  puts 
end