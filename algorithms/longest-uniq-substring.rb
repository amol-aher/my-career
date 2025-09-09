=begin
	Problem Statement
		Given a string, return the longest substring where no characters repeat.
		Example:
			Input:  "abcabcbb"
			Output: "abc"

	Optimal Solution — Sliding Window (O(n))
		Use two pointers (left, right) to represent a sliding window.
		Expand right to include characters.
		If a character repeats, move left to shrink the window until the substring has no duplicates.
		Track the longest substring length and its content.
=end

def longest_unique_substring(str)
	seen = {}
	left = 0
	max_len = 0
	start_idx = 0
	str.chars.each_with_index do |char, right|
		if seen.key?(char) && seen[char] >= left
			left = seen[char] + 1
		end
		seen[char] = right
		if right - left + 1 > max_len
			max_len = right - left + 1
			start_idx = left
		end
	end
	return str[start_idx, max_len]
end

puts longest_unique_substring("abcabcbb")