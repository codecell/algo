class Node
  attr_accessor :value, :next_node
  
  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class MinStack
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
  
  def peek
    return @top.value
  end
  
  def pop
    popped = @top
    @top = @top.next_node
    
    popped.value
  end
end


class Stack
  def push(number)
    new_node = Node.new(number)
    
    if @bottom.nil?
      @bottom = new_node
      @top = @bottom
      @min_stack = MinStack.new
      @min_stack.push(number)
    else
      new_node.next_node = @top
      @top = new_node
      @min_stack.push(number) if number <= @min_stack.peek
    end
  end
  
  def pop
    popped = @top
    @top = @top.next_node
    @min_stack.pop if popped.value == @min_stack.peek
    
    popped.value
  end
  
  def min
    @min_stack.peek
  end
end

stack = Stack.new
stack.push(3)
stack.push(5)
stack.push(1)
stack.push(10)
# puts stack.min
# => 3

puts stack.min
#  1
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