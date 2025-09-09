=begin
	method_missing
	Intercepts calls to undefined methods
	Use case: Create flexible API's or DSL's(eg. find_by_name, find_by_email)
=end

class DynamicMethodHandler
	def method_missing(name, *args)
		puts "Method #{name} is missing and was called with args #{args}"
	end

	def respondt_to_method_missing?(name, include_private: false)
		true
	end
end

obj = DynamicMethodHandler.new
obj.speak(:hello)