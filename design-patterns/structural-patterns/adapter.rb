=begin
	Defination: 	The Adapter Pattern is a structural pattern that allows objects with incompatible 
								interfaces to work together
								It acts as a translator or wrapper between two classes
								Adapter pattern translates interfaces
								Helps plug incompatible classes into existing systems
								Very common when integrating external APIs, legacy systems, or migrating code
	
	Why To use: 	When you want to integrate third-party APIs or libraries with your existing code
								When two systems have similar functionality but different interfaces
								When you want to refactor legacy code without changing its interface

	Use case: 		Imagine you’re in Europe with a U.S. laptop charger
								You can’t plug it directly into the wall. You need an adapter plug
									Your charger = Old interface
									Wall socket = New system
									Adapter = Bridge between both

	Walkthrough: 	App calls pay(49.99)
								Adapter converts 49.99 dollars → 4999 cents
								Calls legacy make_payment method

	Real-World: 	Payment Gateway Adapter
								Third-party API Integration
								ActiveRecord and POROs
								Legacy Code Migration
	
	Benefits: 		Reuse old code => Without changing existing interfaces
								Easy integration => With 3rd-party APIs/libraries
								Decoupling => Clients remain independent of implementation

	Drawbacks: 		Complexity => Adds extra classes/layers
								Indirection =>	Might hide what’s really going on underneath
=end

# You have a PaymentProcessor interface in your app.
# Now you're switching from one provider to another, but want to avoid changing existing code.

# Our app expects this interface
class PaymentProcessor
	def pay(amount)
		raise NotImplementedError
	end
end

# Legacy Payment Gateway
# OldGateway works in cents, while your app uses dollars
class OldGateway
	def make_payment(amount)
		puts "Paid #{amount} cents using OldGateway"
	end
end

# Adapter to OldGateway
class OldGatweayAdapter < PaymentProcessor
	def initialize(old_gateway)
		@old_gateway = old_gateway
	end

	def pay(amount)
		cents = (amount * 100).to_i
		@old_gateway.make_payment(cents)
	end
end

# Useage in app
adapter = OldGatweayAdapter.new(OldGateway.new)
adapter.pay(49.99)

