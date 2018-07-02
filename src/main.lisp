(include "io.h")
(include "node.h")
(include "heuristic.h")

(include <stdlib.h>)

(function main () -> int
	(decl ((uint32_t vertices = (read_int))
				 (uint32_t edges = (read_int))
				 (Node** graph = (read_graph vertices edges))
				 (uint32_t color = (welsh_powell graph vertices))))

	(write_round color)
	(write_allocation graph vertices)

	(for ((uint32_t i = 0) (< i vertices) i++)
		(node_drop graph[i]))
	(free graph)

	(return 0))
