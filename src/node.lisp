(include "node.h")

(include <stdlib.h>)

(function node_new () -> Node*
	(decl ((Node* node = (malloc (sizeof Node)))))
	(= node->neighbors NULL)
	(return node))

(function node_drop ((Node* node)) -> void
	(list_drain node->neighbors)
	(free node))
