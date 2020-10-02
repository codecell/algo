require_relative './node.rb'

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
    return "List is empty" if @head.nil?
    return @head.value if index == 0
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
  
  def get_node(index)
    tracer = @head
    counter = 0
    
    until counter === index
      tracer = tracer.next_node
      counter += 1
    end
    
    tracer
  end
  
  def add_at(index, item)
    new_node = Node.new(item)
    
    return @head = new_node if @head.nil?
    
    if @head && (index == 0)
      new_node.next_node = @head
    elsif index > 0
      pre_insertion_point = get_node(index - 1)
      insertion_point = get_node(index)
      
      pre_insertion_point.next_node = new_node
      new_node.next_node = insertion_point
    end
  end
  
  def remove(index)
    return 'List is empty' if get_length <= 0 
    
    if @head && (index == 0)
      @head = nil
    elsif index == (get_length - 1)
      @tail = nil
    elsif index > 0 && !(index == (get_length - 1))
      deletion_node = get_node(index)
      pre_deletion_node = get_node(index - 1)
      post_deletion_node = get_node(index + 1)
      
      deletion_node = nil
      pre_deletion_node.next_node = post_deletion_node
    end
  end
end


list = LinkedList.new

list.add(3)
list.add(5)
list.add(9)

# list.add_at(1, 11)
# list.add_at(0, 8)
list.remove(1)
puts list.get(1)