=begin
	Definition: 						Depth-First Search (DFS) is a graph traversal algorithm that explores as 
													far as possible along each branch before backtracking. It’s widely used in pathfinding, cycle detection, topological sorting, and more.

	How DFS Works: 					DFS starts at a source node and explores as far down a branch as possible 
													before backtracking. It uses either:
				 										Recursion (implicit stack), or
				 										Explicit stack (iterative approach)

	Data Structures Used: 	Graph: Represented using adjacency list or matrix
													Visited Set: Tracks visited nodes
													Call Stack or Manual Stack: Controls the traversal
=end

# DFS Recursive Algorithm
require 'set'
def dfs(graph, node, visited = Set.new)
	return if visited.include?(node)
	puts "Visiting: #{node}"
	visited.add(node)
	graph[node].each do |neighbor|
		dfs(graph, neighbor, visited)
	end
end

graph = {
  'A' => ['B', 'C'],
  'B' => ['A', 'D', 'E'],
  'C' => ['A', 'F'],
  'D' => ['B'],
  'E' => ['B'],
  'F' => ['C']
}

dfs(graph, 'A')
