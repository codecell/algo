class Node
  attr_accessor :value, :next_node
  
  def initialize(value, next_node = nil)
	  @value = value
    @next_node = next_node
  end
end
class LinkedList
  attr_accessor :head, :tail, :min
  def initialize(head = nil, tail = nil)
    @head = head
    @tail = tail
  end
  def add(number)
    node = Node.new(number)
    if head.nil?
      self.head = node
      self.tail = node
    else
      self.tail.next_node = node
      self.tail = node
    end
  end
  def get(index)
      found_node = get_node(index)
      found_node.value
  end
  
  def add_at(index, item)
    new_item = Node.new(item)
    if index == 0
      new_item.next_node = self.head
      self.head = new_item
    else
      found_node = get_node(index)
      before_found_node = get_node(index-1)
      
      new_item.next_node = found_node
      before_found_node.next_node = new_item
    end
  end
  
  def remove(index)
    if index == 0
      self.head = self.head.next_node
    else
      found_node = get_node(index)
      before_found_node = get_node(index-1)
      after_found_node = get_node(index+1)
      
      before_found_node.next_node = after_found_node
    end
  end
  
  
  private
  
  def get_node(index)
    n = 0
    found = self.head
    
    while n < index
     found = found.next_node
     n += 1
    end
    return found
  end
end
class OldStack
  attr_accessor :list
  
  def initialize
   @list = LinkedList.new
  end
  
  def push(number)
    list.add_at(0, number)
  end
  
  def pop
    popped = list.get(0)
    list.remove(0)
    popped
  end
end
class Stack
  def initialize
    @main_stack = OldStack.new
    @min_stack = OldStack.new
  end
  
  def push(item)
    @main_stack.push(item)
    if @min_stack.list.head.nil? || item < @min_stack.list.head.value
      @min_stack.push(item)
    end
  end
  
  def pop
    popped2 = @main_stack.pop
    @min_stack.pop if popped2 == @min_stack.list.head.value
  end
  
  def min
    @min_stack.list.head.value
  end
end
stack = Stack.new
stack.push(3)
# p stack.list
stack.push(5)
puts stack.min
# p stack.list.head
# => 3
stack.pop
stack.push(7)
puts stack.min
# => 3
stack.push(2)
puts stack.min
# => 2
stack.pop
# p stack.list
puts stack.min
# => 3
# p stack.list.head