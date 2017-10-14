class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
  end
end

class String
  def hash
    total = 0
    self.chars.each_with_index do |ch, idx|
      total -= ch.ord * idx
    end
    total.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
