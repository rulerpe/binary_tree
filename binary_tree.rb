class Node
   
   attr_accessor :value, :left, :right, :parent
    def initialize(value, left = nil, right = nil, parent = nil)
        @value = value
        @left = left
        @right = right        
    end
    
    
    
end


class Tree
    attr_accessor :root, :j
    def initialize(arr)
        build_tree(arr)
    end
    
    def build_tree(arr)
        @root = Node.new(arr[0])
        arr[1..-1].each do |n|
            curr = @root
            while (curr.left != nil) || (curr.right != nil)
                if (n < curr.value) &&(curr.left != nil) 
                    curr = curr.left
                elsif (n > curr.value)&&(curr.right !=nil)
                    curr = curr.right
                else
                    break
                end
            end
            
            if n < curr.value
                curr.left = Node.new(n)
            elsif n > curr.value
                curr.right = Node.new(n)
            end    
            
        end
    end
    
    def bfs(find)
        curr = @root
        qeue = [curr]
        
        temp_qeue = [curr]
        @found = false
        i = 0
        while temp_qeue.empty? == false
            if qeue[i].value == find
                @found = true
                break
            else
                if qeue[i].left != nil
                    qeue << qeue[i].left
                    temp_qeue << qeue[i].left
                end
                if qeue[i].right != nil
                    qeue << qeue[i].right
                    temp_qeue << qeue[i].right
                end
            end
            temp_qeue.delete_at(0)
            i+=1
        
        end
        return @found, i
    end
    
    def dfs(find)
        @j = 0
        @found = false
        dfs_find(find,curr = @root.dup)
        return @found, @j
                
    end
    
    def dfs_find(find,curr)
        if curr.left!=nil && @found!= true
            lcurr = curr.left
            dfs_find(find,lcurr)
            @j += 1
        end
        if curr.right!=nil && @found!=true
            rcurr = curr.right
            dfs_find(find,rcurr)
            @j += 1
        end
        if curr.value == find
            @found = true
        end
        
    end
    
end


test_arr = [5,3,7,1,2,9,6,43,22,54,20,12]
build = Tree.new(test_arr)
#puts build.root.right.right.value

puts build.bfs(6)
puts build.dfs(6)
