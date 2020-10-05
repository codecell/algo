# Start with your code from LinkedList challenge.
class Node 
  attr_accessor :value, :next_node
  
  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class Stack
  attr_accessor :top, :bottom
  
  def initialize(top = nil, bottom = nil)
    @top = top
    @bottom = bottom
  end
  
  # Note: in linked list you add new_nodes to the head, but in a Stack
  # new nodes point directly to the next nodes before them
  def push(number)
    new_node = Node.new(number)
    
    if @bottom.nil?
      @bottom = new_node
      @top = @bottom
    else
      new_node.next_node = @top
      @top = new_node
    end
  end
  
  def pop
    return "List is Empty" if @bottom.nil?

    tracer = @top
    popped = @top.value
    
    unless get_length == 1
      tracer = tracer.next_node
    end
    
    @top = tracer
    
    popped
  end
  
  def get_length
    return 0 if @bottom.nil?
    
    counter = @bottom.nil? ? 0 : 1
    tracer = @top
    
    while tracer.next_node
      tracer = tracer.next_node
      counter += 1
    end
    
    counter
  end
end

stack = Stack.new

stack.push(3)
stack.pop
stack.push(5)
stack.push(12)

stack.pop()
stack.push(10)
stack.pop
p stack.pop 
# stack.push(8)
# stack.pop
# stack.pop