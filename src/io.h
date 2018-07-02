#ifndef MOD_IO
#define MOD_IO

#include <stdlib.h>

#include "node.h"

/**
 * Reads an uint32_t from the standard input
 */
uint32_t read_int();

/**
 * Reads nodes and edges from the standard input
 * 
 * @param numberOfNodes - number of nodes to read
 * @param numberOfEdges - number of edges between then to read
 */
Node** read_graph(uint32_t numberOfNodes, uint32_t numberOfEdges);

/**
 * Writes round file
 * 
 * @param round - last round
 */
void write_round(uint32_t round);

/**
 * Writes allocation file
 * 
 * @param graph - graph with assigned allocations
 * @param size - number of vertices
 */
void write_allocation(Node** graph, uint32_t size);

#endif
