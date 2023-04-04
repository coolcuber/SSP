#ifndef STRUCTURES_H
#include "structures.h"
#endif

PointListLinked* newPLL(float value) {
	PointListLinked *pll = (PointListLinked*) calloc(1, sizeof(PointListLinked));
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
PointListNode* addValueToPLL(PointListLinked *pll, float value) {
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

void freePLL(PointListLinked *pll) {
	PointListNode *node = *pll, *last = NULL;
	while (node != NULL) {
		last = node;
		node = node->next;
		free(last);
	}
	free(pll);
}

PointList* linkedToRegular(PointListLinked *pll) {
	PointListNode *cur = *pll;
	int size = 0;
	while (cur != NULL) {
		size += 1;
		cur = cur->next;
	}
	cur = *pll;
	PointList *pl = (PointList*) calloc(1, sizeof(PointList));
	pl->size = size;
	pl->values = (float*) calloc(size, sizeof(float));
	int i = 0;
	while (cur != NULL) {
		pl->values[i] = cur->value;
		i += 1;
		cur = cur->next;
	}
	freePLL(pll);
	return pl;
}

IndListLinked evaluate(IndMap *map, float point) {
	IndMapping *cur = *map;
	while (cur != NULL) {
		if (cur->point == point) {
			return cur->inds;
		}
		cur = cur->next;
	}
	return NULL;
}

IndListLinked* newILL(int value) {
	IndListLinked *ill = (IndListLinked*) calloc(1, sizeof(IndListLinked));
	*ill = newILN(value);
	return ill;
}

IndListNode* newILN(int value) {
	IndListNode *iln = (IndListNode*) calloc(1, sizeof(IndListNode));
	iln->value = value;
	return iln;
}

/**
 * Add a value to a sorted list.  Returns a pointer to the node added
 */
IndListNode* addValueToILL(IndListLinked *ill, int value) {
	IndListNode *node = newILN(value), *cur = *ill, *last = cur;
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

void freeILL(IndListLinked *ill) {
	IndListNode *node = *ill, *last = NULL;
	while (node != NULL) {
		last = node;
		node = node->next;
		free(last);
	}
	free(ill);
}

PointListLinked* emptyPLL() {
	PointListLinked *pll = (PointListLinked*) calloc(1, sizeof(PointListLinked));
}

IndListLinked* emptyILL() {
	IndListLinked* pll = (IndListLinked*) calloc(1, sizeof(IndListLinked));
}

IndMapping* newIndMapping(float point, int ind) {
	IndMapping *mapping = (IndMapping*) calloc(1, sizeof(IndMapping));
	mapping->point = point;
	mapping->inds = *newILL(ind);
	return mapping;
}

IndMap* emptyIndMap() {
	IndMap* map = (IndMap*) calloc(1, sizeof(IndMap));
}

void addToIntMapping(IndMapping *mapping, int ind) {
	addValueToILL(&(mapping->inds), ind);
}

void freeIndMap(IndMap *map) {
	IndMapping *node = *map, *last = NULL;
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
IndMapping* addValueToMap(IndMap *map, float point, int ind) {
	IndMapping *mapping = newIndMapping(point, ind), *cur = *map, *last = NULL;
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
		addValueToILL(&(cur->inds), ind);
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