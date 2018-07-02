#ifndef MOD_LIST
#define MOD_LIST

#include <stdbool.h>
#include <stdint.h>

typedef struct List List;
struct List {
	uint32_t value;
	List* next;
};

/**
 * Pushes an item to the list
 * 
 * @param list - target
 * @param value - the item
 */
List* list_push(List* list, uint32_t value);

/**
 * Removes an item from the list
 * 
 * @param list - target
 */
List* list_pop(List* list);

/**
 * Returns true if the list is empty
 * 
 * @param list - target
 */
bool list_empty(List* list);

/**
 * Frees the memory used by the list, removing every item
 * 
 * @param list - target
 */
void list_drain(List* list);

#endif
