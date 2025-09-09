=begin
	To find the longest palindromic substring in a given string s, the optimal approach for both simplicity and performance (O(n²)) is to expand around centers.
	Here’s a clean and efficient Ruby implementation:
	
	We use a table dp[i][j]:
		dp[i][j] = true means s[i..j] is a palindrome.
		A single character is always a palindrome (dp[i][i] = true).
		If two characters are equal (s[i] == s[j]) and:
		length = 2 → it's a palindrome.
		length > 2 → check if the inside substring s[i+1..j-1] is a palindrome.
=end

def longest_palindrome(s)
  return "" if s.nil? || s.empty?

  n = s.length
  dp = Array.new(n) { Array.new(n, false) }

  start = 0
  max_len = 1

  # Length 1: all single characters
  (0...n).each { |i| dp[i][i] = true }

  # Length 2: check adjacent pairs
  (0...n-1).each do |i|
    if s[i] == s[i+1]
      dp[i][i+1] = true
      start = i
      max_len = 2
    end
  end

  # Length >= 3: expand and check using DP
  (3..n).each do |len|
    (0..n - len).each do |i|
      j = i + len - 1
      if s[i] == s[j] && dp[i+1][j-1]
        dp[i][j] = true
        start = i
        max_len = len
      end
    end
  end

  s[start, max_len]
end

puts longest_palindrome("babad") 
