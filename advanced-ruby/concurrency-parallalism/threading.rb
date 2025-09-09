=begin
	How Threading Works in Ruby
	
	Ruby uses Green Threads in MRI/YJIT (Matz’s Ruby Interpreter) — they are not truly parallel due to the Global Interpreter Lock (GIL). But it's great for I/O-bound operations like network calls, disk reads, etc.

	For CPU-bound tasks (e.g., image processing), threading doesn't help much in MRI. You need Ractors or multiple processes.
=end

# Use Case: File Processing with Threads
# Threads allow processing of multiple files simultaneously (esp. on SSD or network drives).
files = ['1.txt', '2.txt']
threads = []
files.each do |file|
	threads << Thread.new do
		content = File.read(file)
		puts "Processed file: #{file}"
	end
end
thread.each(&:join)

# CPU-Bound Work: Inefficient with Threads
# This won't speed up on MRI Ruby due to GIL. Use Process.fork or Ractors (Ruby 3+) for real CPU parallelism.
def big_calculation
	10_000_000.times.reduce(:+)
end

threads = 4.times.map do
	Thread.new(big_calculation)
end

threads.each(&:join)