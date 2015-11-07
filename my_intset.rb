class IntSet

  def initialize(max = 20)
    @size = max
    @store = Array.new(max, [])
  end



  def insert(int)
    if int > @size
      double_size
      insert(int)
    end
    bucket_location = find_bucket(int)
    @store[bucket_location] << int
  end

  def remove(int)
    bucket_location = find_bucket(int)
    @store[bucket_location].delete(int)
  end

  def include?(int)
    bucket_location = find_bucket(int)
    @store[bucket_location].include?(int)
  end

  private

  def find_bucket(int)
    int % @store.length
  end

end

# a = IntSet.new
# [3, 4, 7, -2, 12, 78].each {|num| a.insert(num) }
#
# p a.include?(12)
# p a.include?(-2)
# a.remove(12)
# a.remove(-2)
# p a.include?(12)
# p a.include?(-2)
