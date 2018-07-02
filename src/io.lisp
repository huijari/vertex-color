(include "io.h")

(include <stdio.h>)
(include <stdlib.h>)

(function readInt () -> uint32_t
	(decl ((uint32_t value)))
	(scanf "%u" &value)
	(return value))

(function readGraph ((uint32_t numberOfNodes)
										 (uint32_t numberOfEdges)) -> Node**

	(decl ((Node** graph = (malloc (* (sizeof Node*) numberOfNodes)))))

	(for ((uint32_t i = 0) (< i numberOfNodes) i++)
		(set graph[i] (node_new)))

	(for ((uint32_t i = 0) (< i numberOfEdges) i++)
		(decl ((uint32_t from = (- (readInt) 1))
					 (uint32_t to = (- (readInt) 1))))
		(= graph[from]->neighbors (list_push graph[from]->neighbors to))
		(= graph[to]->neighbors (list_push graph[to]->neighbors from)))

	(return graph))
