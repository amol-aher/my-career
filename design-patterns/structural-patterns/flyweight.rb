=begin
	Defination: 	The Flyweight pattern is used to minimize memory usage by sharing common state 
								across multiple objects rather than storing the same data repeatedly.
								It separates intrinsic (shared) and extrinsic (unique) state, allowing many lightweight objects to share heavy common data.
	
	Why To use: 	Large number of similar objects	=> Saves memory
								Shared state among multiple objects	=> Centralized, reusable state
								Performance-sensitive applications => Reduces object creation cost

	Components: 	Flyweight =>	Shared object with intrinsic state
								FlyweightFactory => Manages and reuses Flyweights
								Client => Combines shared and unique state at runtime

	Walkthrough: 	

	Real-World: 	Text Editor (e.g., VSCode)
								Each character might be an object with:
									Font, Size, Color (shared)
									Position (unique)
									Flyweight helps save memory by sharing font/size among many characters.
	
	Benefits: 		Memory Efficient => Less RAM used with shared state
								Reusable => Shared data lives in one place
								Performance Boost =>	Reduced object creation

	Drawbacks: 		Complexity => Requires managing shared vs unique state
								Not thread-safe	=> Shared state can introduce concurrency bugs
								Harder Debugging => Errors might propagate across shared objects
=end

# Flyweight class (TreeType)
class TreeType
	attr_reader :name, :color, :texture
	def initialize(name, color, texture)
		@name = texture
		@color = color
		@texture = texture
	end

	def draw(x, y)
		puts "Drawing #{name} in #{color} with #{texture} at #{x}, #{y}"
	end
end

# FlyweightFactory
class TreeFactory
	@@tree_types = {}
	def self.get_tree_type(name, color, texture)
		key = "#{name}-#{color}-#{texture}"
		@@tree_types[key] ||= TreeType.new(name, color, texture) 
	end
end

# Context Class (Tree) - includes extrinsic state
class Tree
	def initialize(x, y, tree_type)
		@x = x
		@y = y
		@tree_type = tree_type
	end

	def draw
		@tree_type.draw(@x, @y)
	end
end

# Forest to manage all trees
class Forest
	def initialize
		@trees = []
	end

	def plant_tree(x, y, name, color, texture)
		type = TreeFactory.get_tree_type(name, color, texture)
		@trees << Tree.new(x, y, type)
	end

	def draw
		@trees.each(&:draw)
	end
end

forest = Forest.new

forest.plant_tree(10, 20, "Oak", "Green", "Rough")
forest.plant_tree(15, 25, "Oak", "Green", "Rough")  # Uses same TreeType
forest.plant_tree(30, 40, "Pine", "Dark Green", "Smooth")

forest.draw