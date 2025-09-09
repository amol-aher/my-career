=begin
	A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.
	Given a string s, return true if it is a palindrome, or false otherwise.
=end

def is_palindrome?(str)
	cleaned = str.downcase.gsub(/[^a-z0-9]/, '')
	cleaned == cleaned.reverse
end

puts is_palindrome?("A man, a plan, a canal: Panama")  # true
puts is_palindrome?("race a car")                      # false
puts is_palindrome?("12321")                           # true
puts is_palindrome?("No 'x' in Nixon")                 # true