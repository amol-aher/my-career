=begin
	Definition: 	Binary Search is a classic search algorithm used to find the position of a target 
								value within a sorted array. It works by repeatedly dividing the search interval in half.
	Concept: 			The array must be sorted.
								Begin with the whole array.
								Compare the middle element with the target.
								If equal, return the index.
								If the target is smaller, repeat the search on the left half.
								If the target is larger, repeat on the right half.
=end

def binary_search(arr, target)
	low = 0
	high = arr.length - 1
	while low <= high
		mid = (low + high) / 2
		if arr[mid] == target
			return mid
		elsif arr[mid] < target
			low = mid + 1
		else
			high = mid - 1
		end	
	end
end

def recursive_binary_search(arr, target, low = 0, high = arr.length - 1)
	return -1 if low > high
	mid = (low + high) / 2
	if arr[mid] == target
		return mid
	elsif arr[mid] < target
		recursive_binary_search(arr, target, mid + 1, high)
	else
		recursive_binary_search(arr, target, low, high - 1)
	end
end

puts recursive_binary_search([1, 3, 5, 7, 9, 11, 13], 9)