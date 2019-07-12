#A Card has two useful bits of information: its face value, and whether it is face-up or face-down. 
#You'll want instance variables to keep track of this information. You'll also want a method to 
#display information about the card: nothing when face-down, or its value when face-up. 
#I also wrote #hide, #reveal, #to_s, and #== methods.
#

class Card
    def initialize(value)
        @face_value = value
        @face_up = false
    end
    
    attr_accessor :face_up
    
    def display
        face_up ? @face_value : " "
    end
    
    def flip
        @face_up = !face_up
    end
    
    def to_s
        @face_value
    end
    
    def ==(other_card)
        @face_value == other_card.face_value
    end
    
end