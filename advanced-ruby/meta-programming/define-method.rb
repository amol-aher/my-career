=begin
	Allows to define methods dynamically at runtime
	Use case: Dry up repitative method definations	
=end

class Robot
	[:walk, :run, :jump].each do |action|
		define_method(action) do
			puts "Robot is #{action}ing"
		end
	end
end

r = Robot.new
r.walk
r.run
r.jump