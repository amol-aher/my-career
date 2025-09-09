=begin
	Defination: 	The Composite Pattern is a structural design pattern used to treat individual 
								objects and groups of objects the same way
								Compose objects into tree structures to represent part-whole hierarchies. Composite lets clients treat individual objects and compositions uniformly
	
	Why To use: 	Composite pattern helps build tree structures
								Treats single objects and groups uniformly
								Common in UI libraries, filesystems, and validations

	Use case: 		Think of a folder on your computer
									A folder can contain files or other folders
									You can perform the same actions like open, delete, or get size on both
									Whether it's a single file or a folder of files, your action (like right-click → delete) works the same

	Walkthrough: 	When group2.draw is called, it
									Draws circle2
									Calls group1.draw, which
										Draws circle1
										Draws square1

	Real-World: 	UI Components (Buttons, Panels, Forms)
								File System (Files and Directories)
								ActiveModel Validation (Rails)
	
	Benefits: 		Uniformity => Treat individual and composite items the same
								Flexible hierarchy => Easily build complex tree structures
								Open/Closed Principle	=> Add new components without changing existing code

	Drawbacks: 		May become complex => Nested groups and deep trees can be harder to manage
								Hard to enforce rules => Enforcing constraints between composite and leaf nodes may be tricky
=end

# Graphic Objects (Shapes and Groups)
# Let’s create a structure where
# Circle, Square are leaf objects (simple shapes)
# Group is a composite object (can contain many shapes or other groups)

# Component Interface
class Graphic
	def draw
		raise NotImplementedError
	end
end

# Leaf classes
class Circle < Graphic
	def draw
		puts "Drawing #{self.class.name}"
	end
end

class Square < Graphic
	def draw
		puts "Drawing #{self.class.name}"
	end
end

# Composite class
class Group < Graphic
	def initialize(name)
		@name = name
		@children = []
	end

	def add(child)
		@children << child
	end

	def draw
		puts "Group: #{@name} ->"
		@children.each(&:draw)
	end
end

# Use in app
# Create simple shapes
circle1 = Circle.new
square1 = Square.new

# Create group1 and add shapes
group1 = Group.new("First Group")
group1.add(circle1)
group1.add(square1)

# Another shape and group
circle2 = Circle.new
group2 = Group.new("Nested Group")
group2.add(circle2)
group2.add(group1)

# Draw the full composite
group2.draw