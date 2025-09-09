=begin
	Defination: 	The Facade pattern is a structural design pattern that provides a simplified 
								interface to a complex subsystem of classes, libraries, or frameworks.
								It hides the complexity and provides a higher-level, unified interface for the client.
	
	Why To use: 	Subsystems with many moving parts	=> Simplify the API
								Need to decouple the client from the system	=> Improves maintainability
								You want to expose only what's necessary => Encapsulation of internal logic

	Components: 	Facade => Exposes a simplified interface
								Subsystems => Complex or detailed internal classes
								Client => Uses the facade instead of dealing with the subsystem directly

	Walkthrough: 	

	Real-World: 	Home Theater System
								Let's say we have a complex home theater system made of:
									Amplifier
									DVD Player
									Projector
									Screen
									Lights
	
	Benefits: 		Simplicity => Hides internal complexity
								Flexibility	=> Decouples client from subsystems
								Maintainability	=> Changes to subsystems don’t affect clients
								Unified Entry => Point	Ideal for API/Service wrappers

	Drawbacks: 		Overuse	=> Can create unnecessary abstraction if not justified
								One-size-fits-all	=> Not always flexible for every use case if interface is too generic

=end

# Subsystem Classes
class Amplifier
	def on
		puts "Amplifier ON"
	end

	def set_dvd(dvd)
		puts "Amplifier setting DVD to #{dvd}"
	end

	def surround_sound
		puts "Amplifier Surround Sound ON"
	end
end

class DVDPlayer
	def on
		puts "DVD player ON"
	end

	def play(movie)
		puts "DVD player playing #{movie}"
	end
end

class Projector
	def on
		puts "Projector ON"
	end

	def wide_screen_mode
		puts "Projector Wide Screen Mode ON"
	end
end

class TheaterLights
	def dim(level)
		puts "Theater lights dimmed to #{level}"
	end
end

class Screen
	def down
		puts "Screen going down"
	end
end

class HomeTheaterFacade
	def initialize(amp, dvd, projector, lights, screen)
		@amp = amp
		@dvd = dvd
		@projector = projector
		@lights = lights
		@screen = screen
	end

	def watch_movie(movie)
		puts "Starting Movie #{movie}"
		@lights.dim(10)
		@screen.down
		@projector.on
		@projector.wide_screen_mode
		@amp.on
		@amp.set_dvd('DVD Player')
		@amp.surround_sound
		@dvd.on
		@dvd.play(movie)
	end
end

amp = Amplifier.new
dvd = DVDPlayer.new
projector = Projector.new
lights = TheaterLights.new
screen = Screen.new

# Create facade
home_theater = HomeTheaterFacade.new(amp, dvd, projector, lights, screen)

# Use simplified interface
home_theater.watch_movie("Inception")