=begin
	Defination: 	The Memento Pattern is a behavioral design pattern that allows an object to
									Save and restore its internal state without exposing its internal structure
								It’s useful for undo/redo, state history, or time-travel debugging

	When To use: 	Need to save object state without violating encapsulation => Keeps internals private
								Implement undo/redo => Store and restore states
								Snapshot versioning of data => Restore previous versions
	
	Components: 	Originator => The object whose state needs saving
								Memento => The snapshot of internal state
								Caretaker => Manages the history of mementos (like undo/redo stack)

	Real-World: 	Imagine editing a Word document
									You make some changes
									Press Ctrl+Z → restores the last saved state
								This “saved state” is a memento

	Benefits: 		Encapsulation	=> Hides internal structure of the collection
								Reusability => Uniform interface across many types
								Flexibility => Can support multiple iteration strategies
								Composition => Can chain enumerators and filters easily

	Drawbacks: 		Overhead => Custom iterators can add complexity
								Misuse => Without Enumerable, you lose powerful built-in methods
=end

# We’ll build a mini text editor with undo functionality
class TextMemento
	attr_reader :content
	def initialize(content)
		@content = content
	end
end

# Originator
class TextEditor
	attr_accessor :content
	def initialize
		@content = ''
	end

	def write(text)
		@content += text
	end

	def save
		TextMemento.new(@content)
	end

	def restore(memento)
		@content = memento.content
	end
end

# Caretaker
class History
	def initialize
		@mementos = []
	end

	def push(memento)
		@mementos.push(memento)
	end

	def pop
		@mementos.pop
	end
end

# Client code
editor = TextEditor.new
history = History.new
editor.write('Hello')
history.push(editor.save)
editor.write('World')
history.push(editor.save)
editor.write("!!!")
puts "Current Content: #{editor.content}"
puts "Undoing..."
editor.restore(history.pop)
puts "After 1st Undo: #{editor.content}"  # Hello World

editor.restore(history.pop)
puts "After 2nd Undo: #{editor.content}" 