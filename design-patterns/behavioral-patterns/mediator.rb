=begin
	Defination: 	Mediator Pattern is a behavioral design pattern that
									Centralizes complex communication and control logic between objects in a system
									Promotes loose coupling by keeping objects from referring to each other directly
									Objects instead interact through a mediator, which handles coordination
	
	When To use: 	Objects are tightly coupled	=> Removes direct dependencies
								Complex interactions between objects => Centralized coordination
								Reuse is hard	=> Improves modularity
								Components need to talk without knowing each other => Loose coupling

	Components: 	Mediator Interface	Declares communication methods
								ConcreteMediator	Coordinates communication among components
								Colleague	Components that communicate via the mediator
								ConcreteColleague	Implements specific logic and interacts via the mediator

	Real-World: 	Air Traffic Control Tower = Mediator
									Planes = Colleagues
									Planes don’t communicate directly. They all interact via the ATC tower to take off or land, ensuring no collisions
								Chatroom

	Walkthrough: 	User never calls another user's method.
								Chatroom acts as the central coordinator
								The Mediator encapsulates the communication logic

	Benefits: 		Decouples components => Easier to manage and test
								Reusable objects => Mediator handles interaction logic
								Centralized communication => Easier to debug, log, control

	Drawbacks: 		Mediator can become bloated	=> If it takes too much responsibility
								Indirection	=> Adds a layer of abstraction
=end

# Mediator Interface
class ChatRoomMediator
	def show_message(user, message)
		raise NotImplementedError
	end
end

# Concrete Mediator
class ChatRoom < ChatRoomMediator
	def show_message(user, message)
		time = Time.now
		puts "[#{time}] #{user.name}: #{message}"
	end
end

# Colleague (User)
class User
	attr_reader :name
	def initialize(name, chatroom)
		@name = name
		@chatroom = chatroom
	end

	def send_message(message)
		@chatroom.show_message(self, message)
	end
end

# Client code
chatroom = ChatRoom.new
alice = User.new('Alice', chatroom)
bob = User.new('Bob', chatroom)

alice.send_message('Hi Bob!')
bob.send_message('Hello Alice, how are you?')