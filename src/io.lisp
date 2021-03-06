(include "io.h")

(include <stdio.h>)
(include <stdlib.h>)

(function read_int () -> uint32_t
	(decl ((uint32_t value)))
	(scanf "%u" &value)
	(return value))

(function read_graph ((uint32_t numberOfNodes)
										 (uint32_t numberOfEdges)) -> Node**

	(decl ((Node** graph = (malloc (* (sizeof Node*) numberOfNodes)))))

	(for ((uint32_t i = 0) (< i numberOfNodes) i++)
		(set graph[i] (node_new)))

	(for ((uint32_t i = 0) (< i numberOfEdges) i++)
		(decl ((uint32_t from = (- (read_int) 1))
					 (uint32_t to = (- (read_int) 1))))
		(= graph[from]->neighbors (list_push graph[from]->neighbors to))
		(= graph[to]->neighbors (list_push graph[to]->neighbors from)))

	(return graph))

(function write_round ((uint32_t round)) -> void
	(decl ((FILE* file = (fopen "rodada.txt" "w"))))
	(fprintf file "%u\\n" round)
	(fclose file))

(function write_allocation ((Node** graph) (uint32_t size)) -> void
	(decl ((FILE* file = (fopen "alocacao.txt" "w"))))
	(for ((uint32_t i = 0) (< i size) i++)
		(fprintf file "%u %u\\n" (+ i 1) graph[i]->color))
	(fclose file))
