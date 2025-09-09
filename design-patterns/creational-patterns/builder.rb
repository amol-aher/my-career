=begin
	Defination: 	The Builder Pattern is a creational design pattern that allows you to construct 
								complex objects step by step, using a clear and readable API
	
	Why To use: 	To build complex objects (with many optional or nested attributes)
								To make object creation readable and maintainable
								To decouple the object construction process from its representation

	Use case: 		Think of building a custom pizza at a pizza shop
									You choose size, crust, cheese, toppings, etc
									You don't care how the kitchen assembles it internally
									Each choice is optional or required — that's the builder pattern in action

	Walkthrough: 	Call PizzaBuilder.new to start construction
								Each method like .cheese, .pepperoni updates internal state and returns self (for chaining)
								.build returns the final Pizza object
								This is cleaner than passing 6+ parameters to a constructor

	Real-World: 	Form Objects (SignUpFormBuilder)
								Complex Query Builder
								Document/Report Generation
								API Request Builders

	Drawbacks: 		Adds more classes compared to simple instantiation
								Might be overkill for small/simple objects

	Use When: 		Object has many optional parameters
								You want a clean, readable API
								You want immutable, built objects

	Builder Vs Factory
				Feature 						Builder 														Factory
		1.	Goal 								Step-by-step construction 					Single-step object creation
		2.	Best for 						Complex objects with many options 	Simple object type selection
		3.	Returns							One configured object 							Varies based on type
=end

# Building a pizza
class Pizza
	attr_accessor :size, :cheese, :pepperoni, :mushrooms

	def to_s
		"Pizza: size=#{size}, cheese=#{cheese}, pepperoni=#{pepperoni}, mushrooms=#{mushrooms}"
	end
end

# Define builder
class PizzaBuilder
	def initialize
		@pizza = Pizza.new
	end

	def size(size)
		@pizza.size = size
		self
	end

	def cheese(cheese = true)
		@pizza.cheese = cheese
		self
	end

	def pepperoni(pepperoni = true)
		@pizza.pepperoni = pepperoni
		self
	end

	def mushrooms(mushrooms = true)
		@pizza.mushrooms = mushrooms
		self
	end

	def build
		@pizza
	end
end

pizza = PizzaBuilder.new
										.size(10)
										.cheese
										.pepperoni(false)
										.mushrooms(false)
										.build
puts pizza