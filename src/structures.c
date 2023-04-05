#ifndef STRUCTURES_H
#include "structures.h"
#endif

IndexList evaluate(IndexMap *map, float point) {
	IndexMapping *cur = *map;
	while (cur != NULL) {
		if (cur->point == point) {
			return cur->inds;
		}
		cur = cur->next;
	}
	return NULL;
}

/**
 * Returns a pointer to a new (empty) IndexList
 */
IndexList* newil(int value) {
	IndexList *il = (IndexList*) calloc(1, sizeof(IndexList));
	*il = newiln(value);
	return il;
}

/**
 * Add an index to an index list
 */
IndexListNode* iladd(IndexList *il, int value) {
	IndexListNode *node = newiln(value), *cur = *il, *last = cur;
	if (cur == NULL) {
		*il = node;
		return node;
	}
	else if (value == cur->value) {
		return cur;
	}
	else if (value < cur->value) {
		// If the value is lower than the first in the list
		node->next = cur;
		*il = node;
		return node;
	}
	while (cur != NULL && cur->value < value) {
		last = cur;
		cur = cur->next;
	}
	if (cur == NULL) {
		// The value is larger than the values in the list
		last->next = node;
		return node;
	}
	else if (cur->value == value) {
		// The value is equal to the current value
		return cur;
	}
	else {
		// The value is greater than the last and less than the current
		last->next = node;
		node->next = cur;
		return node;
	}
}

/**
 * Deallocate an IndexList
 */
void ilfree(IndexList *il) {
	IndexListNode *node = *il, *last = NULL;
	while (node != NULL) {
		last = node;
		node = node->next;
		free(last);
	}
	free(il);
}

/**
 * Add a new mapping to an IndexMap
 */
IndexMapping* imadd(IndexMap *map, float point, int ind) {
	IndexMapping *mapping = newIndexMapping(point, ind), *cur = *map, *last = NULL;
	while (cur != NULL && cur->point < point) {
		last = cur;
		cur = cur->next;
	}
	if (cur == NULL) {
		// The value is larger than the values in the list
		if (last == NULL) {
			*map = mapping;
			return mapping;
		}
		last->next = mapping;
		return mapping;
	}
	else if (cur->point == point) {
		// The value is equal to the current value
		iladd(&(cur->inds), ind);
		return cur;
	}
	else {
		// The value is greater than the last and less than the current
		if (last == NULL) {
			mapping->next = *map;
			*map = mapping;
			return mapping;
		}
		last->next = mapping;
		mapping->next = cur;
		return mapping;
	}
}

/**
 * Deallocate an IndexMap
 */
void imfree(IndexMap *map) {
	IndexMapping *node = *map, *last = NULL;
	while (node != NULL) {
		last = node;
		node = node->next;
		ilfree(&(last->inds));
		free(last);
	}
	free(map);
}

// Does this function need to be here?
IndexListNode* newiln(int value) {
	IndexListNode *iln = (IndexListNode*) calloc(1, sizeof(IndexListNode));
	iln->value = value;
	return iln;
}

IndexMapping* newIndexMapping(float point, int ind) {
	IndexMapping *mapping = (IndexMapping*) calloc(1, sizeof(IndexMapping));
	mapping->point = point;
	mapping->inds = *newil(ind);
	return mapping;
}

/**
 * Returns a pointer to a new (empty) IndexMap
 */
IndexMap* newim() {
	IndexMap* map = (IndexMap*) calloc(1, sizeof(IndexMap));
}

/**
 * Returns a pointer to a new (empty) PointList
 */
PointList* newpl() {
	PointList *pll = (PointList*) calloc(1, sizeof(PointList));
}

PointListNode* newpln(float value) {
	PointListNode *pln = (PointListNode*) calloc(1, sizeof(PointListNode));
	pln->value = value;
	return pln;
}

/**
 * Add a value to a sorted list.  Returns a pointer to the node added
 */
PointListNode* pladd(PointList *pll, float value) {
	PointListNode *node = newpln(value), *cur = *pll, *last = cur;
	if (cur == NULL) {
		*pll = node;
		return node;
	}
	else if (value == cur->value) {
		return cur;
	}
	else if (value < cur->value) {
		// If the value is lower than the first in the list
		node->next = cur;
		*pll = node;
		return node;
	}
	while (cur != NULL && cur->value < value) {
		last = cur;
		cur = cur->next;
	}
	if (cur == NULL) {
		// The value is larger than the values in the list
		last->next = node;
		return node;
	}
	else if (cur->value == value) {
		// The value is equal to the current value
		return cur;
	}
	else {
		// The value is greater than the last and less than the current
		last->next = node;
		node->next = cur;
		return node;
	}
}

void plfree(PointList *pll) {
	PointListNode *node = *pll, *last = NULL;
	while (node != NULL) {
		last = node;
		node = node->next;
		free(last);
	}
	free(pll);
}