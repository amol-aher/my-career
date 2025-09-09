=begin
	send
	Allows calling method dynamically by name, even private ones
	Use case: Testing private methods or building command executors
=end

class Secret
	private def password
		return 'Hunter2'
	end
end

s = Secret.new
s.send(:password) #=> Hunter2