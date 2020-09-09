require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache

  attr_reader :map, :prc, :max

  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map.include?(key)
      node = map[key]
      update_node!(node)
      node.val
    else
      calc!(key)
    end
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    val = @prc.call(key)
    new_node = @store.append(key, val)
    @map[key] = new_node
    eject! if count > @max
    val
    # suggested helper method; insert an (un-cached) key
  end

  def update_node!(node)
    node.remove
    @map[node.key] = @store.append(node.key, node.val)
    # suggested helper method; move a node to the end of the list
  end

  def eject!
    oldest = @store.first
    oldest.remove
    @map.delete(oldest.key)
  end
end
