class MaxIntSet

  attr_reader :store
  def initialize(max)
    @max = max + 1
    @store = Array.new(@max, false)
  end

  def insert(num)
    @store[num] = true if validate!(num)
  end

  def remove(num)
    if is_valid?(num) && include?(num)
      @store[num] = false
    end
  end

  def include?(num)
    return true if @store[num]
    false
  end

  private

  def is_valid?(num)
    return true if num < @store.length && num >= 0
    raise "Out of bounds"
    false
  end

  def validate!(num)
    return true if is_valid?(num) && !include?(num)
   
    false
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    return if include?(num)
    @store[num % num_buckets] = true
  end

  def remove(num)
    @store[num % num_buckets] = false if include?(num)
  end

  def include?(num)
    return true if self[num] == true
    false
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
