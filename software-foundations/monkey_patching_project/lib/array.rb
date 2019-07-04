# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
      if self.length == 0 
          return nil
      end
      self.max - self.min
  end
  
  def average
      if self.length == 0 
          return nil
      end
      self.sum / (self.length * 1.0)
  end
  
  def median
      temp = self.sort
      if self.length == 0 
          return nil
      elsif self.length.odd?
          return temp[self.length/2]
      end
      (temp[self.length/2] + temp[self.length/2-1]) / 2.0
  end
  
  def counts
      cnt = Hash.new(0)
      self.each {|el| cnt[el] +=1}
      cnt
  end
  
  #----------Part 2-----------#
  def my_count(val)
      cnts = self.counts
      cnts[val]
  end
  
  def my_index(val)
      self.each_with_index {|el,i| return i if el == val }
      nil
  end

  def my_uniq
      arr =[]
      self.each {|el| arr << el if !arr.include?(el) }
      arr
  end  
  
  def my_transpose 
      Array.new(self.size) { |i| Array.new(self.size) { |j| self[j][i] } } 
  end
end
