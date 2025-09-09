=begin
	Definition: 						BFS is a graph traversal algorithm that explores all neighboring nodes at 
													the present depth level before moving on to nodes at the next depth level
													It works well for:
														Finding the shortest path in an unweighted graph
														Level-order traversal in trees

	How BFS Works: 					Queue is used to explore nodes in FIFO order
													You must track visited nodes to avoid cycles and infinite loops
				 									Applicable to graphs, trees, grids, and mazes

	Data Structures Used: 	Graph: Represented using adjacency list or matrix
													Visited Set: Tracks visited nodes
													Call Stack or Manual Stack: Controls the traversal
=end

# BFS Algorithm
def bfs(graph, start)
	visited = []
	queue = [start]
	until queue.empty?
		node = queue.shift
		next if visited.include?(node)
		visited << node
		queue.concat(graph[node]) if graph[node]
	end
	return visited
end

graph = {
  'A' => ['B', 'C'],
  'B' => ['D', 'E'],
  'C' => ['F'],
  'D' => [],
  'E' => [],
  'F' => []
}


puts bfs(graph, 'A').inspect