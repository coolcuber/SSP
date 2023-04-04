#ifndef STRUCTURES_H
#define STRUCTURES_H
#endif

#ifndef STDLIB_H
#include <stdlib.h>
#endif

struct ILL_List;
struct IndexListNode;
struct IndexMapping;
struct PointList;
struct PointListNode;

typedef struct ILL_ListNode ILL_ListNode;
typedef struct IndexListNode IndexListNode;
typedef struct IndexMapping IndexMapping;
typedef struct PointListNode PointListNode;

typedef ILL_ListNode* ILL_List;
typedef IndexListNode* IndexList;
typedef IndexMapping* IndexMap;
typedef PointListNode* PointList;

struct ILL_ListNode {
	IndexList value;
	IndexList *next;
};

struct IndexListNode {
	unsigned int value;
	IndexListNode *next;
};

struct IndexMapping {
	float point;
	IndexList inds;
	IndexMapping *next;
};

struct PointListNode {
	float value;
	PointListNode *next;
};

IndexListNode* iladd(IndexList *ill, int value);
IndexMapping* imadd(IndexMap *map, float point, int ind);
PointListNode* pladd(PointList *pll, float value);
IndexMap* newim();
PointList* newpl();
IndexList evaluate(IndexMap *map, float in);
void ilfree(IndexList *ill);
void imfree(IndexMap *map);
void plfree(PointList *pll);
IndexList* newil(int value);
IndexListNode* newILN(int value);
PointList* newPLL(float value);
PointListNode* newPLN(float value);