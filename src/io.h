#ifndef MOD_IO
#define MOD_IO

#include <stdlib.h>

#include "node.h"

/**
 * Reads an uint32_t from the standard input
 */
uint32_t readInt();

/**
 * Reads nodes and edges from the standard input
 * 
 * @param numberOfNodes - number of nodes to read
 * @param numberOfEdges - number of edges between then to read
 */
Node** readGraph(uint32_t numberOfNodes, uint32_t numberOfEdges);

#endif
