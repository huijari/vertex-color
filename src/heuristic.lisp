(include "heuristic.h")
(include "list.h")

(include <stdbool.h>)
(include <stdlib.h>)
(include <string.h>)

(function orderByDegree ((const void* _a) (const void* _b)) -> int
	(decl ((Node* a = (* (cast Node** _a)))
				 (Node* b = (* (cast Node** _b)))
				 (uint32_t a_size = (list_size a->neighbors))
				 (uint32_t b_size = (list_size b->neighbors))))
	(if (> a_size b_size) (return -1))
	(if (< a_size b_size) (return 1))
	(return 0))

(function welsh_powell ((Node** graph)
												(uint32_t size)) -> uint32_t
	(decl ((Node** vertices = (malloc (* (sizeof Node*) size)))))
	(memcpy vertices graph (* (sizeof Node*) size))
	(qsort vertices size (sizeof Node*) orderByDegree)

	(set vertices[0]->color 1)
	(decl ((uint32_t uncolored = (- size 1))
				 (uint32_t max_color = 0)))
	(while (!= uncolored 0)
		max_color++
		(for ((uint32_t i = 1) (< i size) i++)
			(if (!= vertices[i]->color 0) (continue))
			(decl ((bool touches = false)
						 (List* neighbor = vertices[i]->neighbors)))
			(while (!= neighbor NULL)
				(when (== vertices[neighbor->value]->color max_color)
					(set touches true)
					(break))
				(set neighbor neighbor->next))
			(when !touches
				(set vertices[i]->color max_color)
				uncolored--)))
				
	(free vertices)
	(return max_color))
