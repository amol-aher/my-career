=begin
	Definition: 						A linked list is a linear data structure where each element (node) 
													contains:
														value — data
														next — pointer/reference to the next node in the list
													In a singly linked list, each node points only to the next node
													In a doubly linked list, each node also has a prev pointer to the previous node
													In a Circular Linked List, last node points back to the head.
=end

class Node
	attr_accessor :data, :next

	def initialize(data)
		@data = data
		@next = nil
	end
end

class LinkedList
	attr_accessor :head

	def initialize
		@head = nil
	end

	def empty?
		@head.nil?
	end

	def insert_at_beginning(data)
		new_node = Node.new(data)
		new_node.next = @head
		@head = new_node
	end

	def insert_at_end(data)
		new_node = Node.new(data)
		if @head.nil?
			@head = new_node
			return
		end

		temp = @head
		while temp.next
			temp = temp.next
		end
		temp.next = new_node
	end

	def insert_at_position(data, position)
		return insert_at_beginning(data) if position == 0
		new_node = Node.new(data)
		temp = @head
		(position - 1).times do
			return if temp.nil?
			temp = temp.next
		end
		return if temp.nil?
		new_node.next = temp.next
		temp.next = new_node
	end

	def reverse
		prev = nil
		curr = @head
		while curr
			next_node = curr.next
			curr.next = prev
			prev = curr
			curr = next_node
		end
		@head = prev
	end

	def display
		elements = []
		temp = @head
		while temp
			elements << temp.data
			temp = temp.next
		end
		puts "Linked List: #{elements.join(', ')}"
	end
end

list = LinkedList.new
list.insert_at_beginning(1)
list.insert_at_end(2)
list.insert_at_end(3)
list.insert_at_beginning(5)
list.insert_at_position(6, 3)
list.display
list.reverse
list.display