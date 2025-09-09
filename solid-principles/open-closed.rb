=begin
	Defination: 	Classes should be open for extension but closed for modification
=end

# Bad example
# Every time we need to add a new user type, we modify Discount
class Discount
	def initialize(user)
		@user = user
	end

	def calculate
		if @user.vip?
			20
		else
			10
		end
	end
end

# Refactored code
# We can now extend discount types without changing existing code
class Discount
	def initialize(strategy)
		@strategy = strategy
	end

	def calculate
		@strategy.calculate
	end
end

class RegularDiscount
	def calculate
		return 15
	end
end

class VipDiscount
	def calculate
		return 25
	end
end

discount = Discount.new(VipDiscount.new)
puts discount.calculate