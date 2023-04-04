#ifndef SSP_H
#include "ssp.h"
#endif

DemandZone* newDZ(float x, float y, float w, float h, float v) {
	DemandZone *dz = (DemandZone*) malloc(sizeof(DemandZone));
	dz->x = x;
	dz->y = y;
	dz->w = w;
	dz->h = h;
	dz->v = v;
	return dz;
}

SSP* newSSP() {
	SSP *ssp = (SSP*) calloc(1, sizeof(SSP));
	return ssp;
}

ServiceZone* newSZ(float x, float y, float w, float h) {
	ServiceZone *sz = (ServiceZone*) malloc(sizeof(ServiceZone));
	sz->x = x;
	sz->y = y;
	sz->w = w;
	sz->h = h;
	return sz;
}

void setup(SSP *ssp, PointListLinked *yi, PointListLinked *l, IndMap *ix, IndMap *ox) {
	float ws = ssp->sz.w, hs = ssp->sz.h, wd, xd;
	PointListNode *cur = NULL;
	IndMapping *mapping = NULL;
	for (int i = 0; i < ssp->zones; i++) {
		// Add the interior y-values
		addValueToPLL(yi, ssp->dzs[i].y);
		addValueToPLL(yi, ssp->dzs[i].y + ssp->dzs[i].h - hs);
		cur = *l;
		// Add the interior and exterior x-values
		xd = ssp->dzs[i].x;
		wd = ssp->dzs[i].w;
		addValueToPLL(l, xd - ws);
		addValueToPLL(l, xd);
		cur = addValueToPLL(l, xd + wd - ws);
		addValueToPLL(l, xd + wd);
		// Add to interior mapping
		addValueToMap(ix, ssp->dzs[i].x, i);
		addValueToMap(ix, ssp->dzs[i].x + ssp->dzs[i].w - ws, i);
		// Add to exterior mapping
		addValueToMap(ox, ssp->dzs[i].x - ws, i);
		addValueToMap(ox, ssp->dzs[i].x + ssp->dzs[i].w, i);
	}
}

float getTotalReward(SSP *ssp) {
	float t = 0;
	for (int i = 0; i < ssp->zones; i++) {
		t += getReward(&(ssp->sz), &(ssp->dzs[i]));
	}
	return t;
}

float getReward(ServiceZone *sz, DemandZone *dz) {
	float w = fmin(sz->x + sz->w, dz->x + dz->w) - fmax(sz->x, dz->x);
	float h = fmin(sz->y + sz->h, dz->y + dz->h) - fmax(sz->y, dz->y);
	if (w <= 0 || h <= 0) {
		return 0;
	}
	return dz->v * w * h;
}

ServiceZone* solveSSP(SSP *ssp) {
	ServiceZone *sz = &(ssp->sz);
	PointListLinked *yis = emptyPLL(), *l = emptyPLL();
	IndMap *ix = emptyIndMap(), *ox = emptyIndMap();
	setup(ssp, yis, l, ix, ox);
	float c = 0, y, phi, m, lk, ws = ssp->sz.w, xs, ys;
	PointListNode *ycur = *yis, *xcur = NULL;
	IndListLinked oind, iind;
	while (ycur != NULL) {
		y = ycur->value;
		sz->y = y;
		phi = 0;
		m = 0;
		xcur = *l;
		while (xcur->next != NULL) {
			lk = xcur->value;
			oind = evaluate(ox, lk);
			while (oind != NULL) {
				sz->x = ssp->dzs[oind->value].x;
				m += getReward(sz, &(ssp->dzs[oind->value])) / ws;
				oind = oind->next;
			}
			iind = evaluate(ix, lk);
			while (iind != NULL) {
				sz->x = ssp->dzs[iind->value].x;
				m -= getReward(sz, &(ssp->dzs[iind->value])) / ws;
				iind = iind->next;
			}
			phi += m * (xcur->next->value - lk);
			// printf("(%.3f, %.3f): %.3f\n", xcur->next->value, y, phi);
			if (c < phi) {
				c = phi;
				xs = xcur->next->value;
				ys = y;
			}
			xcur = xcur->next;
		}
		ycur = ycur->next;
	}
	sz->x = xs;
	sz->y = ys;
	freePLL(yis);
	freePLL(l);
	freeIndMap(ix);
	freeIndMap(ox);
	return sz;
}

void drawSSP(SSP *ssp) {
	// Do later
}