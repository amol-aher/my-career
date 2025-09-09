=begin
	Defination: 	The Iterator Pattern is a behavioral design pattern that allows sequential access 
								to the elements of a collection without exposing its internal structure.
								
								It lets you loop through an object (like an array, tree, or custom collection) using a unified interface.

	When To use: 	You want to traverse a collection without exposing internal structure: Encapsulation
								You want to provide multiple or custom iteration strategies: Flexibility
								You want uniform iteration across different collections: Polymorphism

	Real-World: 	Think of a TV remote
									You don’t care how the channels are stored inside the TV.
									You just press Next or Previous
								The remote acts as an iterator — providing access without needing to understand the internals
								Ruby’s Enumerable module is a real-world example of the Iterator pattern
									[1, 2, 3].each { |n| puts n }
									The array is the collection
									.each is the iterator method
									You don’t need to know how the array is implemented

	Benefits: 		Encapsulation	=> Hides internal structure of the collection
								Reusability => Uniform interface across many types
								Flexibility => Can support multiple iteration strategies
								Composition => Can chain enumerators and filters easily

	Drawbacks: 		Overhead => Custom iterators can add complexity
								Misuse => Without Enumerable, you lose powerful built-in methods
=end

# Let’s build a custom BookCollection that we can iterate over using .each
class Book
	attr_reader :title
	def initialize(title)
		@title = title
	end
end

# Define book collection with enumerable
# By implementing #each and including Enumerable, we get map, select, find, etc. for free

class BookCollection
	include Enumerable
	def initialize
		@books = []
	end

	def add(book)
		@books << book
	end

	def each(&block)
		@books.each(&block)
	end
end


collection = BookCollection.new
collection.add(Book.new("Design Patterns"))
collection.add(Book.new("Ruby Metaprogramming"))
collection.add(Book.new("Eloquent Ruby"))
puts "All Books"
collection.each { |book| puts "- #{book.title}" }

puts "Find book containing 'Ruby':"
ruby_book = collection.find { |book| book.title.include?("Ruby") }
puts ruby_book.title