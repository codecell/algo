# Start with your code from last challenge.
class Node
  attr_accessor :value, :next_node
  
  def initialize(value, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

class LinkedList
  attr_accessor :head, :tail
  
  def initialize(head = nil, tail = nil)
    @head = head
    @tail = tail
  end
  
  def add(number)
    node = Node.new(number)
    
    if @head.nil?
      @head = node
      @tail = @head
    else
      @tail.next_node = node
      @tail = node
    end
  end
  
  def get(index)
    list_length = get_length
    return "List is empty" if list_length <= 0
    return "No Such Item, List Length is #{list_length}" if index >= list_length
  
    tracer = 0
    current_node = @head
    
    while tracer < index
      current_node = current_node.next_node
      tracer += 1
    end
    
    current_node.value
  end
  
  def get_length
    return 0 if @head.nil?
    
    counter = @head.next_node.nil? ? 0 : 1
    tracker = @head
    
    until tracker.next_node.nil?
      tracker = tracker.next_node
      counter += 1
    end
    
    counter
  end
end


list = LinkedList.new

list.add(3)
list.add(5)
list.add(9)
# list.add_at(1, 11)
# list.add_at(0, 13)

puts list.get(8)
# => 11

# puts list.get(1)
# puts list.get_length
