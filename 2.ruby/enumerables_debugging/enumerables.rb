
class Array
    
  def my_each(&prc)
    self.length.times do |i|
      prc.call(self[i])
      i += 1
    end
    self
  end
  
  def my_select(&prc)
    newarr = []
    self.my_each {|num| newarr << num if prc.call(num)}
    newarr
  end
  
  def my_reject(&prc)
    newarr = []
    self.my_each {|num| newarr << num unless prc.call(num)}
    newarr
  end
  
  def my_any?(&prc)
    self.my_each {|num| return true if prc.call(num)}
    false
  end
  
  def my_all?(&prc)
    self.my_each {|num| return false unless prc.call(num)}
    true
  end
  
  def my_flatten(data=self)
    arr = []
    if !data.is_a? Array
        return [data]
    end
    data.each {|el| arr += my_flatten(el)}
    arr
  end
  
  def my_zip(*arrays)
    newarr = []
    self.each_with_index do |el,i|
      newarr[i] = [el]
      arrays.each {|array| newarr[i] << array[i]}
    end
    newarr
  end
  
  def my_rotate(shift=1)
    shift = shift % self.length
    self[shift..-1] + self[0...shift]
  end
  
  def my_join(str="")
    result = ""
    self.each_with_index do |ch, i| 
        i == self.length-1 ? result << ch : result << ch + str
    end
    result
  end

  def my_reverse
    result = []
    self.each do |el|
      result.unshift(el)
    end
    result
  end
  def bubble_sort!(&prc)
      prc ||= Proc.new {|a,b| a <=> b}
      sorted = false
      while !sorted do
        sorted = true
        (self.length-1).times do |i| 
          if prc.call(self[i], self[i + 1]) == 1
            self[i], self[i + 1] = self[i + 1], self[i]
            sorted = false
          end
        end
      end
      self 
  end

  def bubble_sort(&prc)
    prc ||= Proc.new{|num1,num2| num1 <=> num2}
    self.dup.bubble_sort!(&prc)
  end

  def substrings(string)
    result = []
    for i in 0..string.length - 1
      for j in i..string.length - 1
        result << string[i..j]
      end
    end
    result.uniq
  end
  
  def subwords(word,dictionary)
    result = []
    substrings(word).each do |str|
      result << str if dictionary.include?(str)
    end
    result
  end
    
end

def factors(num)
  results = []
  (1..num).each do |n|
    results <<  n if num % n == 0
  end
  results
end


