=begin
	Defination: 	High-level modules should not depend on low-level modules. Both should depend on 
								abstractions
=end

# Bad example
# UserService is tightly coupled to FileLogger
class FileLogger
	def log(message)
		File.write('log.txt', message)
	end
end 

class UserService
	def initialize
		@logger = FileLogger.new
	end

	def create_user
		@logger.log('User created')
	end
end

# Refactored code
class FileLogger
	def log(message)
		File.write('log.txt', message)
	end
end

class ConsoleLogger
	def log(message)
		puts "Console logging: #{message}"
	end
end

class UserService
	def initialize(logger)
		@logger = logger
	end

	def create_user
		@logger.log('User created')
	end
end

service = UserService.new(ConsoleLogger.new)
service.create_user