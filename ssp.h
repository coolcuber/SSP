#ifndef SSP_H
#define SSP_H
#endif

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

DemandZone* newDZ(float x, float y, float w, float h, float v);
SSP* newSSP();
ServiceZone* newSZ(float x, float y, float w, float h);
void setup(SSP *ssp, PointListLinked *yi, PointListLinked *l, IndMap *ix, IndMap *ox);
float getReward(ServiceZone *sz, DemandZone *dz);
float getTotalReward(SSP *ssp);
ServiceZone* solveSSP(SSP *ssp);
void readSSP(SSP *ssp, FILE *fp);