class Map
    def initialize
      # create ivar to store stack here!
      @keys = []
      @values = []
    end
    
    def set(key, value)
      # adds an element to the map
      i = @keys.index(key) 
      if i == nil
        @keys << key
        @values << value
      else 
        @values[i] = value
      end
      
    end
    
    def get(key)
      @values[@keys.index(key)] 
    end
    
    def delete(key)
      i = @keys.index(key)
      @keys.slice!(i)
      @values.slice!(i)
    end
    
    def show
      @keys.each_with_index do |k,i|
          print k
          print " => "
          print @values[i]
          puts
      end
    end
end

#set(key, value), get(key), delete(key), show