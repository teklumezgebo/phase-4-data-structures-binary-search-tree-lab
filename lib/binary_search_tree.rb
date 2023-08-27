require_relative './node'

class BinarySearchTree
  attr_accessor :root

  def initialize(root = nil)
    @root = root
  end

  def search(value)
    if root == nil
      return nil
    end

    nodes_to_vist = [root]

    while nodes_to_vist.length > 0
      node = nodes_to_vist.shift

      if node.left 
        nodes_to_vist.push(node.left)
      end

      if node.right
        nodes_to_vist.push(node.right)
      end

      if node.value == value
        return node
      end
    end
  end

  def insert(value)
    node = Node.new(value)

    if root == nil
      @root = node
    end

    nodes_to_vist = [root]

    while nodes_to_vist > 0
      inspected_node = nodes_to_vist.shift
      puts nodes_to_vist

      if value < inspected_node.value
        if inspected_node.left
          nodes_to_vist.push(inspected_node.left)
        else 
          inspected_node.left = node
        end
      else
        if inspected_node.right
          nodes_to_vist.push(inspected_node.right)
        else
          inspected_node.right = node
        end
      end
    end


    node
  end

end 
