=begin
	Defination: 	One class should have only one reason to change.
=end

# Bad example
# This class is doing two things: generating a report and saving to a file.
class Report
	def initialize(data)
		@data = data
	end

	def generate
		# Report generation logic here
	end

	def save_to_file
		# PDF file logic here
	end
end

# Refactored Code
# Now each class has a single responsibility
class Report
	def initialize(data)
	end

	def generate
	end
end

class ReportSaver
	def initialize(report)
		@report = report
	end

	def save_to_file
		File.write('test.txt', @report.generate)
	end
end