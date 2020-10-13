class Node
  attr_accessor :value, :next_node
  
  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end


class Stack

  def push(number)
    new_node = Node.new(number)
    if @bottom.nil?
      @bottom = new_node
      @top = @bottom
    else
      new_node.next_node = @top
      @top = new_node
    end
    # your code here
  end
  
  def pop
    popped = @top
    @top = @top.next_node
    
    popped.value
  end
  
  def min
    min_node = @bottom
    tracer = @top
    while tracer.next_node
      if tracer.value <= min_node.value
        min_node = tracer
      end
      
      tracer = tracer.next_node
    end
    
    min_node.value
  end

end

stack = Stack.new
stack.push(3)
stack.push(5)
# puts stack.min
# => 3

puts stack.pop()

# stack.pop
# stack.push(7)
# puts stack.min
# => 3

# stack.push(2)
# puts stack.min
# => 2

#stack.pop
#puts stack.min
# => 3