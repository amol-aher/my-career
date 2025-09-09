=begin
	Defination: 	The Bridge Pattern is a structural design pattern that decouples an abstraction 
								from its implementation so that the two can vary independently.
								The Bridge Pattern is about splitting abstraction from implementation
								Useful when you expect to extend both abstraction and implementation separately
								Promotes composition over inheritance
	
	Why To use: 	To avoid rigid inheritance hierarchies
								To separate high-level logic from platform-specific details
								To extend classes and behavior independently without creating an explosion of subclasses

	Use case: 		Think of building a custom pizza at a pizza shop
									You choose size, crust, cheese, toppings, etc
									You don't care how the kitchen assembles it internally
									Each choice is optional or required — that's the builder pattern in action

	Walkthrough: 	RemoteControl.new(sony) => Bridge created between remote and Sony TV
								remote1.turn_on	=> Remote delegates call to SonyTV#turn_on
								remote2.set_channel(10) =>	Delegates to LGTV#set_channel

	Real-World: 	Remote Control (Abstraction)
								TVs of different brands (Implementations)
								You want the remote to work with Samsung, Sony, or LG TV
									Rather than making => SonyRemote, SamsungRemote, LgRemote, etc
								A Remote that takes a TV interface — letting each evolve independently.
	
	Benefits: 		Decouples Abstraction from Implementation => (Change them independently)
								Cleaner Architecture =>	Avoids deep inheritance
								Easier to Extend	=> Add more features without touching core logic
								Promotes Composition =>	Favor composition over inheritance

	Drawbacks: 		More Classes => Introduces multiple layers and indirection
								Complexity => Harder to follow for simple problems
=end

# Define interface implementation
class Device
	def turn_on
		raise NotImplementedError
	end

	def turn_off
		raise NotImplementedError
	end

	def change_channel
		raise NotImplementedError
	end
end

# Implement concrete classes
class SonyTV < Device
	def turn_on
		puts "Turning on #{self.class.name}"
	end

	def turn_off
		puts "Turning off #{self.class.name}"
	end

	def change_channel(channel)
		puts "Changing channel of #{self.class.name} to #{channel}"
	end
end

class LgTV < Device
	def turn_on
		puts "Turning on #{self.class.name}"
	end

	def turn_off
		puts "Turning off #{self.class.name}"
	end

	def change_channel(channel)
		puts "Changing channel of #{self.class.name} to #{channel}"
	end
end

# Define abstraction
class Remote
	def initialize(device)
		@device = device
	end

	def turn_on
		@device.turn_on
	end

	def turn_off
		@device.turn_off
	end

	def change_channel(channel)
		@device.change_channel(channel)
	end
end

# Use Bridge
sony = SonyTV.new
lg = LgTV.new

sony_remote = Remote.new(sony)
lg_remote = Remote.new(lg)

sony_remote.turn_on
sony_remote.change_channel(5)
sony_remote.turn_off

lg_remote.turn_on
lg_remote.change_channel(5)
lg_remote.turn_off