require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless self.include?(key)
      @count += 1
      if @count > @store.size
        resize!
        self[key] << key
      else
        self[key] << key
      end
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    self[key].include?(key)
  end

  private

  def [](num)
    num_hash = num.hash
    @store[num_hash % @store.length]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
    # @store.length
  end

  def resize!
    numbers =[]

    @store.each do |bucket|
      bucket.each do |int|
        numbers << int
      end
    end

    @store = Array.new(2*@store.length) { Array.new }

    numbers.each do |num|
      self[num] << num
      # insert(num)
    end
  end
end
