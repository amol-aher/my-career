account: 

assessment:

rating:

class Account
	has_many :assessments, class_name: "Assessment"
end

class Assessment
	belongs_to :account, class_name: 'Account'
	has_many :ratings, class_name: 'Rating'
end

class Rating
	belongs_to :assessment, class_name: 'Assessment'
end

select a.id 
from accounts a
left join assessments assessment on assessment.account_id = a.id
where not exists(
	select 1 from ratings r where r.assessment_id = assessment.id
)

rating_ids_greater_than_five = Rating.where('rating > ?', 5).pluck(:assessment_id).uniq
Account.where(id: Assessment.where(id: rating_ids_greater_than_five)).pluck(:name)

select acc.id, acc.name
from accounts acc
left join assessments a ON a.id IN (
	select * from r 
)

5 request per min

class RateLimiter

	def initialize(user_id)
		@user_id = user_id
		@interval = 5
		@limit = 5
		@time_stamps = {
			user_id.to_s: []
		}
	end

	def check_request
		now = Time.now.to_i
		@time_stamps[@user_id.to_s].reject {|n| n <= now - @interval }
		if @time_stamps.length < @limit
			@time_stamps[@user_id.to_s] << now
			puts "Okay for #{@user_id}"
		else
			puts "Limit reached for #{@user_id}"
		end
	end

end