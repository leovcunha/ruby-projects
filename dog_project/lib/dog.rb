class Dog
    def initialize(name, breed, age, bark, favorite_foods)
        @name = name
        @breed = breed
        @age = age
        @bark = bark
        @favorite_foods = favorite_foods
    end
    
    def name
        @name
    end
    
    def age
        @age
    end    
    
    def breed
        @breed
    end
    
    def bark
        (@age > 3 ? @bark.upcase : @bark.downcase)
    end
    
    def favorite_foods
        @favorite_foods
    end
    
    def favorite_food?(food)
        @favorite_foods.map {|w| w.downcase}.include?(food.downcase) 
    end

    def name=(a)
        @name=a
    end
    
    def age=(a)
        @age=a
    end 
    
    def breed=(b)
        @breed=b
    end
    
    def bark=(b)
        @bark=b
    end
    
    def favorite_foods=(f)
        @favorite_foods=f
    end
end
