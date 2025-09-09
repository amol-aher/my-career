=begin
Concurrency:
	1.	Concurrency in Ruby refers to the ability of a program to deal with multiple tasks at the 
			same time — not necessarily by executing them in parallel (which is parallelism), but by interleaving their execution to make the best use of resources and reduce waiting time (like I/O blocking).
	2.	Ruby supports concurrency through threads, fibers, processes, and event loops.

Concurrency vs Parallelism
	Concurrency: Multiple tasks are making progress at the same time (interleaved execution)
	Parallelism: Multiple tasks are executing simultaneously on different CPU cores

Ruby Concurrency Tools
	Thread: 						Native threading support in Ruby for concurrent execution
	Fiber: 							Lightweight cooperative concurrency, like green threads
	Process:						True parallelism using fork or separate processes via Process.spawn
	Ractors (Ruby 3+):	For true parallel execution with isolated memory
	Async gems:					EventMachine, Async, Celluloid, Sidekiq for structured concurrency

Real-World Use Cases for Concurrency
	1.	Web Scraping Multiple Sites Simultaneously
	2.	Sending Emails or Notifications in Parallel
	3.	Downloading Files Concurrently
	4.	Making API calls to third parties (e.g., Google, Stripe)
	5.	Processing background jobs (Sidekiq)

Use Case:
	Fetching Multiple APIs Concurrently
	You want to fetch weather, news, and stock price data from different APIs and show the result in under 2 seconds.
=end

# Sequential Blocking
# This would take ~3 seconds if each API takes ~1 second.
require 'net/http'
require 'json'

def fetch_data(url)
  uri = URI(url)
  JSON.parse(Net::HTTP.get(uri))
end

start = Time.now

weather = fetch_data('https://api.weatherapi.com/v1/current.json?q=London')
news    = fetch_data('https://newsapi.org/v2/top-headlines?country=us')

puts "Total time: #{Time.now - start} seconds"

# Concurrent version using threads
require 'net/http'
require 'json'

def fetch_data(url)
  uri = URI(url)
  JSON.parse(Net::HTTP.get(uri))
end

start = Time.now
weather_thread = Thread.new {
	fetch_data('https://api.weatherapi.com/v1/current.json?q=London')
}

news_thread = Thread.new {
	fetch_data('https://newsapi.org/v2/top-headlines?country=us')
}

weather = weather_thread.value
news    = news_thread.value

puts "Total time: #{Time.now - start} seconds"