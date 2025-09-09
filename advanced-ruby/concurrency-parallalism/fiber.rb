=begin
	Fibers are like manual thread slices — you control when they pause and resume.
=end

fiber = Fiber.new do
	puts "Step One"
	Fiber.yield
	puts "Step Two"
end

fiber.resume
sleep(2)
fiber.resume