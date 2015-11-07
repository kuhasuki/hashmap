require_relative 'p02_hashing'

class HashSet
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

  def find_bucket(data)
    data.hash % num_buckets
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
