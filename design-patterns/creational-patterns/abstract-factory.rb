=begin
	Defination: 	Abstract Factory pattern provides an interface for creating families of related or 
								dependent objects without specifying their concrete classes
	
	Why To use: 	To ensure consistency among products like (UI for mac, Windows)
								To decouple object creation from systems that uses that objects
								To allow for easy extension of new families of products without changing client code
	
	Use case: 		Imagine you are building a cross platform UI library
								You want to support
									Mac UI with MacButton, MacCheckbox
									Windows UI with WinButton, WinCheckbox
								Each family has consistent look and feel

	Walkthrough: 	Application expects an abstract factory (UIFactory)
								You pass MacFactory or WindowsFactory
								The app calls create_button, create_checkbox which return respective UI components
								You can change the UI platform by just switching the factory - No other code changes requried
=end

# UI Factory
class Button
	def render
		raise NotImplementedError
	end
end

class CheckBox
	def render
		raise NotImplementedError
	end
end

# Concrete products
class MacButton < Button
	def render
		"Rendering #{self.class.name}"
	end
end

class MacCheckBox < CheckBox
	def render
		"Rendering #{self.class.name}"
	end
end

class WindowsButton < Button
	def render
		"Rendering #{self.class.name}"
	end
end

class WindowsCheckBox < CheckBox
	def render
		"Rendering #{self.class.name}"
	end
end

# Abstract Factory
class UIFactory
	def create_button
		raise NotImplementedError
	end

	def create_checkbox
		raise NotImplementedError
	end
end

# Concrete Factories
class MacFactory < UIFactory
	def create_button
		MacButton.new
	end

	def create_checkbox
		MacCheckBox.new
	end
end

class WindowsFactory < UIFactory
	def create_button
		WindowsButton.new
	end

	def create_checkbox
		WindowsCheckBox.new
	end
end

# Client Code
class Application
	def initialize(factory)
		@button = factory.create_button
		@check_box = factory.create_checkbox
	end

	def render_ui
		puts @button.render
		puts @check_box.render
	end
end

# Usage
factory = MacFactory.new
app = Application.new(factory)
app.render_ui