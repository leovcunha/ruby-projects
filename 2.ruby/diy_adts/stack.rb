class Stack
    def initialize
      # create ivar to store stack here!
      @var = []
    end
    
    def push(el)
      # adds an element to the stack
      @var << el
    end
    
    def pop
      # removes one element from the stack
      @var.pop
    end
    
    def peek
      # returns, but doesn't remove, the top element in the stack
      @var[-1]
    end
end