# Start with your code from LinkedList challenge.
class Node
  attr_accessor :value, :next_node
  
  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end


class Queue
  def initialize(front = nil, back = nil)
    @front = front
    @back = back
  end
  
  def add(number)
    new_node = Node.new(number)
    
    if @front.nil?
      @front = new_node
      @back = @front
    else
      @back.next_node = new_node
      @back = new_node
    end
  end
  
  def remove
    return -1 if @front.nil?
    
    tracer = @front
    dequeued = @front.value

    tracer = tracer.next_node
    
    @front = tracer
    
    dequeued
  end
  
  def get_length
    return 0 if @front.nil?
    
    tracer = @front
    counter = @front.nil? ? 0 : 1
    
    until tracer.next_node.nil?
      tracer = tracer.next_node
      counter += 1
    end
    
    counter
  end
end

queue = Queue.new

queue.add(3)
queue.add(5)
puts queue.remove
# => 3

queue.add(2)
queue.add(7)
#puts queue.remove
# => 5

p queue.get_length

#puts queue.remove
# => 2

#puts queue.remove
# => 7

#puts queue.remove
# => -1