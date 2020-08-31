class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return if include?(key)
    self[key.hash].push(key)
    @count += 1
    resize! if @count > num_buckets
  end

  def include?(key)
    self[key.hash].include?(key)
  end

  def remove(key)
    return if !include?(key)
    self[key.hash].delete(key)
    @count -= 1
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
