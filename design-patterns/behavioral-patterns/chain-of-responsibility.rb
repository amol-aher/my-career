=begin
	Defination: 	Chain of Responsibility is a behavioral design pattern that lets you pass requests 
								along a chain of handlers. Each handler decides:
									whether to process the request
									or to pass it to the next handler in the chain
	
	When To use: 	Multiple handlers can handle a request => Logging → Auth → Data validation
								Order of responsibility matters	=> Middleware chains
								Avoid hardcoded handler logic => Flexible and extensible handling

	Components: 	Handler	=> Abstract class/interface declaring handle(request)
								ConcreteHandler	=> Implements the logic and optionally forwards the request
								Client => Sends the request to the first handler in the chain

	Walkthrough: 	

	Real-World: 	Support Ticket Handler
								We will create a ticket processing system with three levels:
									Level 1: Can handle "simple" issues
									Level 2: Can handle "intermediate" issues
									Level 3: Handles anything else
	
	Benefits: 		Flexible request handling	=> Easily change/add/remove handlers
								Decouples sender from receiver => Doesn’t need to know who will handle
								Dynamic behavior at runtime	=> Reorder or swap handlers easily

	Drawbacks: 		Debugging can be hard	=> Hard to trace where request ends
								Handlers must cooperate	=> Order matters; failure to pass may break the chain
=end

# Abstract Handler
class SupportHandler
	attr_accessor :next_handler
	def set_next(handler)
		@next_handler = handler
		handler
	end

	def handle(request)
		if @next_handler
			@next_handler.handle(request)
		else
			puts "No one to handle the request: #{request}"
		end
	end
end

class LevelOneSupport < SupportHandler
	def handle(request)
		if request == :simple
			puts "Level 1 support: Handled #{request} issue"
		else
			super
		end
	end
end

class LevelTwoSupport < SupportHandler
	def handle(request)
		if request == :intermediate
			puts "Level 2 support: Handled #{request} issue"
		else
			super
		end
	end
end

class LevelThreeSupport < SupportHandler
	def handle(request)
		puts "Level 3 support: Handled #{request}"
	end
end

l1 = LevelOneSupport.new
l2 = LevelTwoSupport.new
l3 = LevelThreeSupport.new

l1.set_next(l2).set_next(l3)
puts "\nIncoming request: :simple"
l1.handle(:simple)
puts "\nIncoming request: :intermediate"
l1.handle(:intermediate)
puts "\nIncoming request: :complex"
l1.handle(:complex)
