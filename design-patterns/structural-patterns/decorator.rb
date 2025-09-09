=begin
	Defination: 	The Decorator Pattern is a structural design pattern that allows you to dynamically 
								add new behavior or responsibilities to an object, without modifying its code.
								Decorator lets you wrap an object with more behavior
								You can chain decorators to build behavior dynamically
								In Ruby, you can implement it via composition and duck typing
	
	Why To use: 	To extend functionality without altering original class code
								To compose behavior at runtime
								To follow the Open/Closed Principle: open for extension, closed for modification

	Use case: 		Think of coffee at a cafe
									Base drink: Espresso
									Add-ons: Milk, Sugar, Whipped Cream
								Rather than having
									MilkEspresso, SugarMilkEspresso, WhippedSugarMilkEspresso, etc
								Use decorators
									Milk.new(Sugar.new(Espresso.new))

	Walkthrough: 	Espresso.new	=> Base beverage
								Milk.new(...)	=> Wrap espresso with milk
								Sugar.new(...) =>	Wrap milk+espresso with sugar
								Call cost or description =>	Recursively calls all wrappers

	Real-World: 	Rails Controllers / Views (before_action, helper_method, view_component)
								Rails SimpleDelegator or delegate methods
								Logging / Analytics
								Formatting Presenters
	
	Benefits: 		Flexible =>	Add behavior without subclassing
								Composable => Stack multiple decorators together
								Reusable =>	Use decorators independently
								Single Responsibility => Each class handles one concern

	Drawbacks: 		Hard to debug	=> Multiple wrappers can confuse stack traces
								Order-sensitive	=> Wrapping order affects behavior
								More classes => Adds indirection and complexity
=end

# Define base interface
class Beverage
	def cost
		raise NotImplementedError
	end

	def description
		raise NotImplementedError
	end
end

# Concrete component
class Espresso < Beverage
	def cost
		return 100
	end

	def description
		return 'Espresso'
	end
end

# Decorator Base
class AddOnDecorator < Beverage
	def initialize(beverage)
		@beverage = beverage
	end
end

# Add concrete decorators
class Milk < AddOnDecorator
	def cost
		@beverage.cost + 5
	end

	def description
		@beverage.description + ", Milk"
	end
end

class Sugar < AddOnDecorator
	def cost
		@beverage.cost + 5
	end

	def description
		@beverage.description + ", Sugar"
	end
end

# Compose decorators
coffee = Sugar.new(Milk.new(Espresso.new))
puts "#{coffee.description} @ #{coffee.cost}"