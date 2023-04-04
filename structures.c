#ifndef STRUCTURES_H
#include "structures.h"
#endif

PointList* newPLL(float value) {
	PointList *pll = (PointList*) calloc(1, sizeof(PointList));
	*pll = newPLN(value);
	return pll;
}

PointListNode* newPLN(float value) {
	PointListNode *pln = (PointListNode*) calloc(1, sizeof(PointListNode));
	pln->value = value;
	return pln;
}

/**
 * Add a value to a sorted list.  Returns a pointer to the node added
 */
PointListNode* pladd(PointList *pll, float value) {
	PointListNode *node = newPLN(value), *cur = *pll, *last = cur;
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

IndexList* newil(int value) {
	IndexList *ill = (IndexList*) calloc(1, sizeof(IndexList));
	*ill = newILN(value);
	return ill;
}

IndexListNode* newILN(int value) {
	IndexListNode *iln = (IndexListNode*) calloc(1, sizeof(IndexListNode));
	iln->value = value;
	return iln;
}

/**
 * Add a value to a sorted list.  Returns a pointer to the node added
 */
IndexListNode* iladd(IndexList *ill, int value) {
	IndexListNode *node = newILN(value), *cur = *ill, *last = cur;
	if (cur == NULL) {
		*ill = node;
		return node;
	}
	else if (value == cur->value) {
		return cur;
	}
	else if (value < cur->value) {
		// If the value is lower than the first in the list
		node->next = cur;
		*ill = node;
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

void ilfree(IndexList *ill) {
	IndexListNode *node = *ill, *last = NULL;
	while (node != NULL) {
		last = node;
		node = node->next;
		free(last);
	}
	free(ill);
}

PointList* newpl() {
	PointList *pll = (PointList*) calloc(1, sizeof(PointList));
}

IndexList* emptyILL() {
	IndexList* pll = (IndexList*) calloc(1, sizeof(IndexList));
}

IndexMapping* newIndexMapping(float point, int ind) {
	IndexMapping *mapping = (IndexMapping*) calloc(1, sizeof(IndexMapping));
	mapping->point = point;
	mapping->inds = *newil(ind);
	return mapping;
}

IndexMap* newim() {
	IndexMap* map = (IndexMap*) calloc(1, sizeof(IndexMap));
}

void addToIntMapping(IndexMapping *mapping, int ind) {
	iladd(&(mapping->inds), ind);
}

void imfree(IndexMap *map) {
	IndexMapping *node = *map, *last = NULL;
	while (node != NULL) {
		last = node;
		node = node->next;
		free(last);
	}
	free(map);
}

/**
 * Add a value to a sorted list.  Returns a pointer to the node added
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