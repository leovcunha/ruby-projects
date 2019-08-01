class Queue
    def initialize
      # create ivar to store queue here!
      @var = []
    end
    
    def queue(el)
      # adds an element to the queue
      @var.unshift el
    end
    
    def dequeue
      # removes one element from the queue
      @var.pop
    end
    
    def peek
      # returns, but doesn't remove, the last element in the queue
      @var[0]
    end
end