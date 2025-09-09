=begin
	Defination: 	The Prototype Pattern is a creational design pattern that allows you to create new 
								objects by copying (cloning) existing ones, instead of instantiating new ones from scratch.
	
	Why To use: 	To avoid expensive creation of new objects (e.g., object with costly setup)
								To create copies of objects with slight modifications
								To maintain object templates for reuse
								To implement custom cloning logic if deep copy is needed

	Use case: 		Think of building a custom pizza at a pizza shop
									You choose size, crust, cheese, toppings, etc
									You don't care how the kitchen assembles it internally
									Each choice is optional or required — that's the builder pattern in action

	Walkthrough: 	You create original using constructo
								You call .clone, which creates a new object with copied values
								You modify the copy (author = "Bob"), but the original stays unchanged

	Real-World: 	UI Elements / Widgets
								Game Development (Enemies/Characters)
								Document or Report Generation
								E-commerce Product Variants

	Benefits: 		Performance (Avoids reinitializing expensive objects)
								Flexibility (Easily customize new objects)
								Simplicity (Don’t need large constructors)
								Memory efficient (Only clones what you need)

	Drawbacks: 		Deep Copy Complexity => Need to handle nested objects manually
								Harder to Maintain =>	Can get messy if objects have complex internal states
								Misuse Risk =>Can lead to bugs if cloned object is modified unknowingly

	Use When: 		You want to copy objects instead of creating new ones
								Your objects are expensive to create
								You want a template-style cloning system
								Use .clone or .dup carefully depending on deep/shallow needs
=end

# Define prototype class

class Document
	attr_accessor :title, :content, :author

	def initialize(title, content, author)
		@title = title
		@content = content
		@author = author
	end

	def clone
		return Document.new(title.dup, content.dup, author.dup)
	end
end

original = Document.new('Monthly Report', 'Revenue is up by 20%', 'Alice')
copy = original.clone
copy.author = 'Bob'
copy.title = 'Monthly Report Copy'

puts "Original: #{original.title} by #{original.author}"
puts "Copy: #{copy.title} by #{copy.author}"