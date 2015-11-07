require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
  end

  def set(key, val)
    resize! if @count == num_buckets
    bucket_location = find_bucket(val)
    @store[bucket_location].insert(key, val)
    @count += 1
  end

  def get(key)
    @store.each do |list|
      if list.include?(key)
        p list
        return list.get(key)
      end
    end
  end

  def delete(key)
  end

  def each
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def find_bucket(data)
    data.hash % num_buckets
  end

  def num_buckets
    @store.length
  end

  def resize!
    # old_store = @store.flatten(1)
    # @store = Array.new(@count * 2, [])
    # @count = 0
    # old_store.each { |num| self.insert(num) }
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end


hash = HashMap.new
hash.set(:first, 1)
