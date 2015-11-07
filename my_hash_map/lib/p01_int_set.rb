class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    validate!(num)
    @store[num] = true
  end

  def remove(num)
    validate!(num)
    @store[num] = false
  end

  def include?(num)
    validate!(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num < @max && num >= 0
  end

  def validate!(num)
    raise "Out of bounds" unless is_valid?(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    bucket_location = find_bucket(num)
    @store[bucket_location] << num
  end

  def remove(num)
    bucket_location = find_bucket(num)
    @store[bucket_location].delete(num)
  end

  def include?(num)
    bucket_location = find_bucket(num)
    @store[bucket_location].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def find_bucket(int)
    int % @store.length
  end

end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @count == num_buckets
    bucket_location = find_bucket(num)
    @store[bucket_location] << num
    @count += 1
  end

  def remove(num)
    self[num].delete(num)
    @count -= 1
  end

  def include?(num)
    bucket_location = find_bucket(num)
    @store[bucket_location].include?(num)
  end

  private

  def [](num)
    bucket_location = find_bucket(num)
    @store[bucket_location]
  end

  def find_bucket(int)
    int % num_buckets
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store.flatten(1)
    @store = Array.new(@count * 2, [])
    @count = 0
    old_store.each { |num| self.insert(num) }
  end

end
