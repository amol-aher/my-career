=begin
	Defination: 	The Factory Method Pattern defines an interface for creating an object, but lets 
								subclasses (or a factory class) decide which class to instantiate
	
	Why To use: 	To encapsulate object creation logic
								To follow the Open/Closed Principle – you can add new object types without modifying existing code
								To create objects based on conditions (like a type symbol or config)

	Use case: 		Imagine an online notification system:
									Based on the channel (:email, :sms, :push), we want to send the notification differently
									We don’t want the user of the system to worry about which class to use
									Let the Factory choose the right object for us

	Walkthrough: 	You call NotificationFactory.create(:sms)
								Factory switches on :sms and returns an instance of SMSNotification
								You call send on the returned object
								You don't care how it was created — just that it behaves as expected

	Real-World: 	Notification Systems
								Payment Gateway Integrations
								Logging System
								Document Exporter
								Game Characters / Enemies
=end

# Define product interface
class Notifier
	def send(message)
		raise NotImplementedError, "Subclasses must implement 'send'"
	end
end

class EmailNotifier < Notifier
	def send(message)
		puts "Email sent"
	end
end

class SMSNotifier < Notifier
	def send(message)
		puts "SMS sent"
	end
end

class PushNotifier < Notifier
	def send(message)
		puts "Push sent"
	end
end

class NotifierFactory
	def self.create(type)
		case type
		when :email then EmailNotifier.new
		when :sms then SMSNotifier.new
		when :push then PushNotifier.new
		else
			raise "unknown notification type: #{type}" 
		end
	end	
end

notifier = NotifierFactory.create(:sms)
notifier.send("#{notifier.class.name} - Message")