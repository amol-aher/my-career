=begin
	Defination: 	Clients should not be forced to depend on methods they do not use.
								Ruby doesn’t have interfaces like Java/C#, but we can use Duck Typing to apply the same idea
=end

# Bad example
# This forces OldPrinter to implement methods it doesn’t need
class Machine
	def print
	end

	def scan
	end

	def fax
	end
end

class OldPrinter < Machine
	def print
		puts "Printing"
	end

	def scan
		raise NotImplementedError
	end

	def fax
		raise NotImplementedError
	end
end

# Refactored code
# Split into smaller role-based abstractions
class Printer
	def print
	end
end

class Scanner
	def scan
	end
end

class OldPrinter < Printer
	def print
		puts "Printing only"
	end
end