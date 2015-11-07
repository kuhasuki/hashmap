class MaxIntSet

  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(int)
    @store[int] = true
  end

  def remove(int)
    @store[int] = false
  end

  def include?(int)
    @store[int]
  end

end

# p guy = MaxIntSet.new(15)
# p guy.include?(7)
# p guy.insert(7)
# p guy.include?(7)
# p guy.remove(7)
# p guy.include?(7)
