=begin
	With which Ruby and Rails versions you started, and currently on which Ruby and Rails versions 
	you are working?
=end

=begin
	I started my professional journey with Ruby 2.3 and Rails 4.2, which was widely used in production at that time. While working on those versions, I learned the fundamentals of Rails conventions, MVC design pattern, ActiveRecord, REST APIs, and how Rails manages routing and background jobs.

	As technology evolved, I upgraded my skills and worked on Ruby 2.6 with Rails 5.2, where I got hands-on experience with ActionCable for real-time features, API-only applications, and improved ActiveStorage functionalities.

	Currently, I am working with Ruby 3.2 and Rails 7.x, which provide significant performance improvements, concurrency features (like Ractors), Hotwire for faster frontend updates, and improved support for API and WebSocket-based applications.
=end

=begin
	Short Answer
		I started working with Ruby 2.3 and Rails 4.2, and over time I upgraded through Ruby 2.6/Rails 5.2. Currently, I am working on Ruby 3.2 and Rails 7.x, which gives me hands-on experience with the latest performance improvements, Hotwire/Turbo, and modern API features.
=end

=begin
	Follow-up Questions
	
	Q1: What differences did you notice while upgrading from older Rails versions to newer ones?
	A: 	Rails 4 to Rails 5 introduced API-only applications, ActionCable, and improved ActiveRecord 
			query methods.
			Rails 6 introduced multi-database support, ActionText, and parallel testing.
			Rails 7 emphasizes Hotwire/Turbo for frontend interactivity, reduced need for heavy frontend frameworks, and much better encrypted attributes support.

	Q2: How did you handle application upgrades across versions?
	A: 	I usually follow a step-by-step upgrade path: update Ruby first, then Rails, and upgrade gems 
			accordingly.
			I rely on tools like bundle outdated and rails app:update to check for compatibility issues.
			I also maintain a solid test suite (RSpec/Minitest) to ensure nothing breaks after the upgrade.

	Q3: What are some Ruby version differences you have noticed?
	A:	Ruby 2.3 lacked pattern matching and had slower garbage collection.
			Ruby 2.7 introduced pattern matching and deprecation warnings.
			Ruby 3.x focuses on performance improvements, Ractors for concurrency, and Fiber Scheduler for async I/O.
=end

