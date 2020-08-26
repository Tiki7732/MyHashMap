class MaxIntSet

  attr_reader :store
  def initialize(max)
    @store = Array.new(max, false)
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
    return true if num.between?(0, @store.length - 1)
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
    self[num].push(num)
  end

  def remove(num)
   self[num].delete(num) if include?(num)
  end

  def include?(num)
    self[num].include?(num)
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
    return if include?(num)
    resize! if num_buckets == @count
    @count += 1
    self[num].push(num)
  end

  def remove(num)
    if include?(num)
      self[num].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    nums = []
    @store.each do |buckets|
      buckets.each do |number|
        nums << number
        self.remove(number)
      end
    end
    @store.concat(Array.new(num_buckets) {Array.new})
    nums.each { |num| self.insert(num)}
  end
end
