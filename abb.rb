class Tree

  attr_accessor :root, :how_many_nodes

  def initialize(key)
    @root = Node.new(key)
    @how_many_nodes = 1
  end

  def include?(key)
    @root.include?(key)
  end

  class Node

    attr_accessor :left, :right, :parent, :key, :value, :how_many_nodes_left, :how_many_nodes_right

    def initialize(key, parent = nil)
      @left   = nil
      @right  = nil
      @how_many_nodes_left  = 0
      @how_many_nodes_right = 0
      @parent = parent
      @key    = key
    end
    
    def include?(k)
      case key <=> k
      when 1  then left.include?(k) if left
      when -1 then right.include?(k) if right
      when 0  then return true
      end
      return false 
    end

    def inspect
      "{#{key}::#{left.inspect}|#{right.inspect}}"
    end

  end

end
