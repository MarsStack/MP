class PolyTreeNode
    attr_reader :value, :parent, :children, :test

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
        @test = "hello"
    end

    def inspector
        if @children.length == 0
            return "<PolyTreeNode @value=#{value}, @children=[]"
        else
            returnval = "<PolyTreeNode @value=#{value}, @children="
            @children.each do |child|
                return returnval += "#{child.inspect}"
            end
        end
    end

    def parent=(parentnode)

        # leftside.parent=(newparent)
        # leftside is any node
        # leftside currently has a parent
        # 
        oldparent = @parent
        if oldparent != nil
            oldparent.children.delete(self)
        end

        @parent = parentnode
        #node.children should include self
        # 
        # node1's children should include node2
        # nodeq.parent=(node2)
        # this sets node2 to the parent of node1
        # we then have to set node1 to be the child of node2
        #parentnode.children << self
        if parentnode != nil
            parentnode.children << self
            parentnode.children.uniq!
        end
    end

    
    

end