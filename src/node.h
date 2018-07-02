#ifndef MOD_NODE
#define MOD_NODE

#include <stdbool.h>

#include "list.h"

typedef struct Node Node;
struct Node {
	uint16_t color;
	List* neighbors;
};

/**
 * Creates a new node
 */
Node* node_new();

/**
 * Frees the memory used by the node
 * 
 * @param node - target
 */
void node_drop(Node* node);

#endif
