#ifndef STRUCTURES_H
#define STRUCTURES_H
#endif

#ifndef STDLIB_H
#include <stdlib.h>
#endif

struct ILL_List;
struct IndListLinked;
struct IndListNode;
struct IndMapping;
struct PointList;
struct PointListLinked;
struct PointListNode;

typedef struct ILL_ListNode ILL_ListNode;
typedef struct IndListNode IndListNode;
typedef struct IndMapping IndMapping;
typedef struct PointList PointList;
typedef struct PointListNode PointListNode;

typedef ILL_ListNode* ILL_List;
typedef IndListNode* IndListLinked;
typedef IndMapping* IndMap;
typedef PointListNode* PointListLinked;

struct ILL_ListNode {
	IndListLinked value;
	IndListLinked *next;
};

struct IndListNode {
	unsigned int value;
	IndListNode *next;
};

struct IndMapping {
	float point;
	IndListLinked inds;
	IndMapping *next;
};

struct PointList {
	int size;
	float *values;
};

struct PointListNode {
	float value;
	PointListNode *next;
};

IndListNode* addValueToILL(IndListLinked *ill, int value);
IndMapping* addValueToMap(IndMap *map, float point, int ind);
PointListNode* addValueToPLL(PointListLinked *pll, float value);
IndMap* emptyIndMap();
PointListLinked* emptyPLL();
IndListLinked evaluate(IndMap *map, float in);
void freeILL(IndListLinked *ill);
void freeIndMap(IndMap *map);
void freePLL(PointListLinked *pll);
IndListLinked* newILL(int value);
IndListNode* newILN(int value);
PointList* linkedToRegular(PointListLinked *pll);
PointListLinked* newPLL(float value);
PointListNode* newPLN(float value);
PointList* newPointList(int size);