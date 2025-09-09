=begin
	Defination: 	Proxy Pattern is a structural design pattern that provides a placeholder or 
								surrogate for another object to control access to it
	
	Why To use: 	To avoid rigid inheritance hierarchies
								To separate high-level logic from platform-specific details
								To extend classes and behavior independently without creating an explosion of subclasses

	Use case: 		Lazy Initialization =>	Load object only when needed
								Access Control => Restrict access (auth, roles)
								Logging/Monitoring => Log calls to an object
								Remote Proxies => Represent an object in a different process/server
								Smart References => Reference counting, caching, etc.

	Walkthrough: 	

	Real-World: 	ActiveRecord Associations (Rails)
								Caching Proxy
								Authorization Proxy
								Imagine a security guard at a vault
									You can't access the vault directly. You must go through the guard (proxy), who checks
										Do you have access?
										Is it open hours?
										Log the request
									The vault is the real object; the guard is the proxy
	
	Benefits: 		Purpose	=> Add an interface to control access to a real object
								Use Case => Lazy load, access control, caching, logging
								Real World => Rails, caching systems, security wrappers

	Drawbacks: 		Extra Layer	=> May add complexity
								Proxy Abuse	=> Too many proxies can reduce transparency
								Performance	=> Delegation may add overhead
=end

# Let’s simulate an app that loads large image files. 
# To improve performance, we use a proxy to load the image only when needed (lazy loading)

# Subject Interface
class Image
	def display
		raise NotImplementedError
	end
end

# Real Object (Heavy)
class RealImage < Image
	def initialize(filename)
		@filename = filename
		load_from_disk
	end

	def load_from_disk
		puts "Loading image #{@filename} from disk"
		sleep(1)
	end

	def display
		puts "Displaying: #{@filename}"
	end
end

class ProxyImage < Image
	def initialize(filename)
		@filename = filename
		@real_image = nil
	end

	def display
		if @real_image.nil?
			@real_image = RealImage.new(@filename)
		end
		@real_image.display
	end
end

image = ProxyImage.new("flower.png")

puts "Image created. Not loaded yet."

puts "\nCalling display the first time:"
image.display

puts "\nCalling display again:"
image.display