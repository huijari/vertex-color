#ifndef MOD_HEURISTIC
#define MOD_HEURISTIC

#include <stdint.h>

#include "node.h"

/**
 * Runs the Welsh-Powell algorithm, assigning colors for each vertex.
 * Returns the number of colors used.
 * 
 * @param graph - target
 * @param size - number of vertices
 */
uint32_t welsh_powell(Node** graph, uint32_t size);

#endif
