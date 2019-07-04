    
class HumanPlayer

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_input
      puts "Enter the position of the card you want to flip (e.g. 2,3)"
      gets.chomp.split(",").map(&:to_i) 
  end
  
  def receive_revealed_card(val,pos)
  end

end