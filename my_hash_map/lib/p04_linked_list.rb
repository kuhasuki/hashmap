class Link
  attr_accessor :key, :val, :next

  def initialize(key = nil, val = nil, nxt = nil)
    @key, @val, @next = key, val, nxt
  end

  def to_s
    "#{@key}, #{@val}"
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Link.new
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    if @head.next.nil?
      first
    else
      previous_link, current_link = @head.next, @head.next.next
      until current_link.next.nil?
        previous_link, current_link = current_link, current_link.next
      end
      previous_link.val
    end
  end

  def empty?
    @head.next.nil?
  end

  def get(key)
    if @head.next.key == key && !@head.next.nil?
      return @head.next.val
    else
      link = @head.next.next
      until link.nil?
        return link.val if link.key == key
        link = link.next
      end
    end
  end


  def include?(key)
    !self.get(key).nil?
  end

  def insert(key, val)
    if @head.next.nil?
      @head.next = Link.new(key, val)
    else
      tail = @head.next
      until tail.next.nil?
        tail = tail.next
      end
      tail.next = Link.new(key, val)
    end
  end

  def remove(key)
    if @head.next.key == key
      @head.next = @head.next.next
    elsif self.include?(key)
      previous_link, current_link = @head.next, @head.next.next
      until current_link.key == key
        previous_link, current_link = current_link, current_link.next
      end
      previous_link.next = current_link.next
    end
  end

  def each(&prc)

    values = []

    tail = @head.next
    until tail.next.nil?
      values << tail
      tail = tail.next
    end

    values << tail
    values.each {|obj| prc.call(obj)}
    values
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end

# list = LinkedList.new
# list.insert(:first, 1)
# list.insert(:second, 2)
# list.insert(:third, 3)
# list.insert(:fourth, 3)
# list.insert(:fifth, 3)
# p list
