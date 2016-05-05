class Tree

  attr_accessor :root, :how_many_nodes

  def initialize(key)
    @root = Node.new(key)
    @how_many_nodes = 1
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

  end

end
