=begin
	Defination: 	Subtypes must be substitutable for their base types without breaking the 
								application.
=end

# Bad example
# This breaks LSP because Ostrich shouldn’t inherit fly as they dont fly
class Bird
	def fly
		'Flying'
	end
end

class Ostrich < Bird
end

ostrich = Ostrich.new
puts ostrich.fly

# Good example
# Now subclasses only implement behavior they support
class Bird
end

class FlyingBird < Bird
	def fly
		puts "Flying"
	end
end

class Ostrich < Bird
	def walk
		puts "Walking"
	end
end

flying_bird = FlyingBird.new
flying_bird.fly

walking_bird = Ostrich.new
walking_bird.walk
