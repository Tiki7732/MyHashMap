class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    hash_id = 0
    self.each_with_index do |el, ind|
      hash_id += ind.hash
      hash_id *= el.hash
    end
    hash_id
  end
end

class String
  def hash
    hash_id = 0
    each_char.with_index do |char, ind|
      hash_id += (ind.hash * char.ord.hash)
      hash_id += self.length.hash
    end
    hash_id
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hash_id = 0
    self.to_a.sort.each_with_index do |el, ind|
      hash_id += ind.hash
      hash_id *= el.hash
    end
    hash_id
    
  end
end

# a = ("a".."z").to_a * 3
# b = a.shuffle
# p a.join
# p a.join.hash
# p b.join.hash