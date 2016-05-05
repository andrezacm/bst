class Tree

  attr_accessor :root, :how_many_nodes

  def initialize(key)
    @root = Node.new(key)
    @how_many_nodes = 1
  end

  def include?(key)
    @root.include?(key)
  end

  def add_node(key)
    @root.add_node(Node.new(key))
  end

  def delete_node (key)
    @root.delete_node(key)
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

    def add_node(node)
      case key <=> node.key
      when 1  then add_left(node)
      when -1 then add_right(node)
      when 0  then true
      end      
    end
    
    def delete_node(k)
      case key <=> k
        when 0 then delete()
      end
    end

    def inspect
      "{#{key}::#{left.inspect}|#{right.inspect}}"
    end


    private
    
      def delete()
        if parent
          if how_many_nodes_left == 0 and how_many_nodes_right == 0 then
            parent.left  = nil if parent.left.key  == key
            parent.right = nil if parent.right.key == key
          end
      end

      def add_left(node)
        if how_many_nodes_left == 0 then
          add_node_in_left_tree(node)
        else
          left.add_node(node)
        end
      end
      
      def add_right(node)
        if how_many_nodes_right == 0 then
          add_node_in_right_tree(node)
        else
          right.add_node(node)
        end
      end

      def add_node_in_left_tree(node)
        @left = node
        @how_many_nodes_left+=1
        node.parent = self
      end

      def add_node_in_right_tree(node)
        @right = node
        @how_many_nodes_right+=1
        node.parent = self
      end

  end

end
