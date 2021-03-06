#linked list

class Node 
    attr_accessor :value, :next

    def initialize (value=nil, next_node=nil)
        @value = value
        @next = next_node
    end
end

class SinglyLinkedList

    def initialize ()
        #create list with sentinel node, link head to it
        @head = Node.new()
        @length = 0
    end

    def isEmpty ()
        return @head.next.nil?
    end

    def length ()
        return @length
    end

    def get (index)

        current = @head.next

        if index < 0 then
            second = current
            index += 1

            while index < 0 and !second.next.nil? do
                index += 1
                second = second.next
            end

            if index < 0 then
                return nil
            end

            while !second.next.nil? do
                second = second.next
                current = current.next
            end

            return current.value           
        end

        i = 0
        while current != nil do
            if i == index then 
                return current.value
            end
            current = current.next
            i += 1
        end 

        return nil
    end

    def add (value, index)
        current = @head #insert will happen after current

        if index < 0 then
            second = current
            index += 1

            while index < 0 and !second.next.nil? do
                index += 1
                second = second.next
            end

            if index < 0 then
                return nil
            end

            while !second.next.nil? do
                second = second.next
                current = current.next
            end           
        end

        i = 0

        while current != nil and i <= index do
            if i == index then 
                new_node = Node.new(value, current.next) 
                current.next = new_node
                @length += 1
                return
            end
            current = current.next
            i += 1
        end 
    end

    def remove (index)
        current = @head #remove will happen after current

        if index < 0 then
            second = current

            while index < 0 and !second.next.nil? do
                index += 1
                second = second.next
            end

            if index < 0 then
                return nil
            end

            while !second.next.nil? do
                second = second.next
                current = current.next
            end           
            value = current.next.value
            current.next = current.next.next
            @length -= 1
            return value
        end

        i = 0

        while current.next != nil and i <= index do
            if i == index then 
                value = current.next.value
                current.next = current.next.next
                @length -= 1
                return value
            end
            current = current.next
            i += 1
        end 
    end

    def reverse ()
        new_head = Node.new(nil, nil) #sentinel node for reversed list
        current = @head

        while current != nil do
            node = current 
            current = current.next
            node.next = new_head.next
            new_head.next = node
        end 
        @head = new_head
    end
    
    def iterate ()
        current_node = @head.next

        while current_node != nil
            yield current_node.value
            current_node = current_node.next
        end
    end

    def addToStart (value)
        self.add(value, 0)
    end

    def addToEnd (value)
        self.add(value, -1)
    end

end