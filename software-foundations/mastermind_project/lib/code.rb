class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  
  def self.valid_pegs?(array)
    ay
    rray.all? { |char| POSSIBLE_PEGS.include?(char.upcase) }
  end
  
  def initialize(array)
    raise if !Code.valid_pegs?(array)
    @pegs = array.map(&:upcase)
  end
  
  attr_reader :pegs

  def self.random(num)
    pegs = Array.new(num) { POSSIBLE_PEGS.keys.sample }
    Code.new(pegs)
  end

  def self.from_string(string)
    Code.new(string.split(""))
  end

  def [](index)
    pegs[index]
  end

  def length
    pegs.length
  end

  def num_exact_matches(guess)
    (0...guess.length).count { |i| guess[i] == pegs[i]}
  end

  def num_near_matches(guess)
    (0...guess.length).count do |i|
      guess_peg = guess[i]
      pegs.include?(guess_peg) && guess_peg != pegs[i]
    end
  end

  def ==(other_code)
     pegs == other_code.pegs
  end

end
