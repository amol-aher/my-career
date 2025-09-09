=begin
	Defination: 	The Command Pattern is a behavioral design pattern that turns a request into a 
								stand-alone object that contains
									all the information about the action
									the method to call
									the object that owns the method
									and the parameters
								This decouples the sender (who wants the action done) from the receiver (who performs it)
	
	When To use: 	Need to queue or log requests	=> Store commands and replay
								Implement undo/redo	=> Reverse commands
								Decouple sender from receiver =>	Keeps responsibilities separate
								Use macros (batch commands)	=> Chain multiple actions

	Components: 	Command	=> Interface declaring execute
								ConcreteCommand => Implements the action on a receiver
								Receiver => The actual object that performs the action
								Invoker => Holds and triggers commands
								Client => Creates and sends commands to invoker

	Walkthrough: 	

	Real-World: 	Text Editor Undo System
								Let’s build a simple text editor that supports
									Inserting text
									Deleting text
									Undoing the last command

	Benefits: 		Decouples sender & receiver	=> Cleaner architecture
								Supports undo/redo => Reversible commands
								Enables queuing	=> Retry failed commands
								Easier to log	=> Record all actions

	Drawbacks: 		Boilerplate	=> Many classes for simple tasks
								Can be overkill	=> Not useful for simple actions
=end

# Receiver
class TextEditor
	attr_reader :text
	def initialize
		@text = ''
	end

	def write(content)
		@text += content
	end

	def delete_last(count)
		removed = @text[-count..-1]
		@text = @text[0...-count]
		removed
	end
end

# Command Interface
class Command
	def execute
		raise NotImplementedError
	end

	def undo
		raise NotImplementedError
	end
end

# Concrete commands
class WriteCommand < Command
	def initialize(editor, content)
		@editor = editor
		@content = content
	end

	def execute
		@editor.write(@content)
	end

	def undo
		@editor.delete_last(@content.length)
	end
end

# Invoker
class EditorInvoker
	def initialize
		@history = []
	end

	def execute(command)
		command.execute
		@history.push(command)
	end

	def undo
		last_command = @history.pop
		last_command.undo if last_command
	end
end

# Client
editor = TextEditor.new
invoker = EditorInvoker.new

puts "\nWriting Hello"
invoker.execute(WriteCommand.new(editor, 'Hello'))
puts "Current text: #{editor.text}"

puts "\n Writing 'World!'"
invoker.execute(WriteCommand.new(editor, "World!"))
puts "Current Text: #{editor.text}"

puts "\n Undo last write"
invoker.undo
puts "Current Text: #{editor.text}"

puts "\n Undo again"
invoker.undo
puts "Current Text: #{editor.text}"