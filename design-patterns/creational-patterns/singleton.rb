=begin
	Defination: 	The Singleton Pattern ensures that a class has only one instance and provides a 
								global access point to that instance
								Ruby comes with a built-in module for Singleton in the standard library
	
	Why To use: 	You want only one instance of a class throughout the program
								Useful when managing shared resources (e.g., configuration, logging, database connection pool)
								Prevents the overhead of creating multiple instances unnecessarily

	Use case: 		Think of a printer spooler in a computer system
									Only one instance should control access to the printer
									If multiple spoolers exist, it could cause conflicts or duplication of jobs

	Walkthrough: 	AppConfig.instance is the only way to access the object
								Setting theme via config1 reflects in config2
								equal? confirms they’re the same instance

	Real-World: 	Configuration managers
								Logging systems
								Database connection pools

	BTS: 					When we use include Singleton, it
									Makes .new private
									Adds .instance class method
									Ensures thread-safe lazy instantiation
=end

require 'singleton'

class AppConfig
	include Singleton
	attr_accessor :app_name, :theme
end

c1 = AppConfig.instance
c1.app_name = "iOS app"
c1.theme = 'Dark'

c2 = AppConfig.instance
puts "App name: #{c2.app_name} - #{c2.theme}"

c1.equal?(c2)

# Custom singleton without module
class Logger
	private_class_method :new

	def self.instance
		@instance ||= new
	end

	def log(msg)
		pyts "[LOG] #{msg}"
	end
end

# Database connections pool manager
class DBPool
	include Singleton

	def initialize
		@connections = []
	end

	def get_connection
		@connections.pop || create_connection
	end

	def release_connection(conn)
		@connections << conn
	end

	def create_connection
		Object.new #=> Simulate DB connection here
	end
end