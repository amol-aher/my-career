=begin
	Definition: 	Merge Sort is a classic Divide and Conquer sorting algorithm that
								Splits the array into halves recursively
								Sorts each half
								Merges the sorted halves back together

	Concept: 			Divide: Split the array into two halves
								Conquer: Recursively sort the halves
								Combine: Merge the sorted halves
=end

=begin
	Let’s sort:
	[6, 3, 8, 5, 2, 7, 4, 1]

	Split:
	→ [6, 3, 8, 5] and [2, 7, 4, 1]

	Split further:
	→ [6, 3] and [8, 5], then → [6] [3], [8] [5]

	Merge:
	→ [3, 6], [5, 8]

	Then merge again:
	→ [3, 5, 6, 8]

	Repeat for the second half, then merge both:
	→ Final sorted: [1, 2, 3, 4, 5, 6, 7, 8]
=end

def merge_sort(arr)
	return arr if arr.length <= 1
	mid = arr.length / 2
	left = merge_sort(arr[0...mid])
	right = merge_sort(arr[mid...arr.length])
	merge(left, right)
end

def merge(left, right)
	sorted = []
	until left.empty? || right.empty?
		if left.first <= right.first
			sorted << left.shift
		else
			sorted << right.shift
		end
	end
	return sorted + left + right
end

arr = [6, 3, 8, 5, 2, 7, 4, 1]
puts merge_sort(arr).inspect