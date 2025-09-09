=begin
	Problem Statement
		Given an array of integers, find a peak element.
		A peak is an element that is greater than or equal to its neighbors.
		For edge elements, we only need to check one neighbor.
		Example:
			arr = [1, 3, 20, 4, 1, 0]
			Here, 20 is a peak because it’s greater than 3 (left) and 4 (right).
=end

def find_peak(arr)
	n = arr.length
	return nil if n == 0
	return arr[0] if n == 1 || arr[0] >= arr[1]
	return arr[n - 1] if arr[n - 1] >= arr[n - 2]
	(1...(n - 1)).each do |i|
		if arr[i] >= arr[i - 1] && arr[i] >= arr[i + 1]
			return arr[i]
		end
	end
end

def find_peak_binary(arr)
	left = 0
	right = arr.length - 1
	while left < right
		mid = (left + right) / 2
		if arr[mid] < arr[mid + 1]
			left = mid + 1
		else
			right = mid
		end
	end
	arr[left]
end

arr = [1, 3, 20, 4, 1, 0]
puts find_peak(arr)
puts find_peak_binary(arr)