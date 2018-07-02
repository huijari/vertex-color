(include "list.h")

(include <stdlib.h>)

(function list_push ((List* next) (uint32_t value)) -> List*
	(decl ((List* list = (malloc (sizeof List)))))
	(= list->value value)
	(= list->next next)
	(return list))

(function list_pop ((List* list)) -> List*
	(decl ((List* next = list->next)))
	(free list)
	(return next))

(function list_empty ((List* list)) -> bool
	(return (== list NULL)))

(function list_drain ((List* list)) -> void
	(while (! (list_empty list))
		(= list (list_pop list))))
