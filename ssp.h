#ifndef SSP_H
#define SSP_H

#ifndef MATH_H
#include <math.h>
#endif
#ifndef STDIO_H
#include <stdio.h>
#endif
#ifndef STDLIB_H
#include <stdlib.h>
#endif
#ifndef STRING_H
#include <string.h>
#endif

#ifndef STRUCTURES_H
#include "structures.h"
#endif

#define PRECISION 0.01

struct DemandZone;
struct ServiceZone;
struct SSP;

typedef struct DemandZone DemandZone;
typedef struct ServiceZone ServiceZone;
typedef struct SSP SSP;

struct DemandZone {
	float x;
	float y;
	float w;
	float h;
	float v;
};

struct ServiceZone {
	float x;
	float y;
	float w;
	float h;
};

struct SSP {
	int zones;
	DemandZone* dzs;
	ServiceZone sz;
};

int floatequals(float f1, float f2);
int floatpos(float f);
void makedzs(SSP *ssp, size_t size);
SSP* newssp();
void printdz(DemandZone *dz);
void printsz(ServiceZone *sz);
void readssp(SSP *ssp, FILE *fp);
float reward(ServiceZone *sz, DemandZone *dz);
void setup(SSP *ssp, PointList *yi, PointList *l, IndexMap *ix, IndexMap *ox);
float solvessp(SSP *ssp);
void sspfree(SSP *ssp);
int szequals(ServiceZone *sz1, ServiceZone *sz2);
float totalreward(SSP *ssp);

#endif