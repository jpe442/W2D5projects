require 'byebug'

class MaxIntSet
  def initialize(max = 1)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    if is_valid?(num)
      raise "Already in set" if @store[num]
      @store[num] = true
    end
  end

  def remove(num)
    if is_valid?(num)
      raise "Not in set, dude!" if !@store[num]
      @store[num] = false
    end
  end

  def include?(num)
    @store[num] if is_valid?(num)
  end

  private

  def is_valid?(num)
    raise "Out of bounds" if num < 0 || num > @max - 1
    true
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    p self[num] << num
  end

  def remove(num)
    self[num].delete(num) if self.include?(num)

  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % @store.length]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 1)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    # byebug
    unless self.include?(num)
      @count += 1
      if @count > @store.size
        resize!
        self[num] << num
      else
        self[num] << num
      end
    end
  end

  def remove(num)
    self[num].delete(num) if self.include?(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % @store.length]
  end

  def num_buckets
    @store.length
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
