#ifndef SSP_H
#include "ssp.h"
#endif

/**
 * Check if two floats are equal (up to PRECISION)
 */
int floatequals(float f1, float f2) {
	return fabs(f1 - f2) < PRECISION;
}

/**
 * Check if a float is positive (up to PRECISION)
 */
int floatpos(float f) {
	if (f > 0) {
		return 1;
	}
	return f > -PRECISION;
}

/**
 * Initialize the dynamic array of DZs in the SSP
 */
void makedzs(SSP *ssp, size_t size) {
	ssp->zones = size;
	ssp->dzs = (DemandZone*) calloc(size, sizeof(DemandZone));
}

/**
 * Returns a pointer to a new (empty) SSP
 */
SSP* newssp() {
	SSP *ssp = (SSP*) calloc(1, sizeof(SSP));
	return ssp;
}

/**
 * Print a DZ to stdout
 * Not used in current implementation, but could be useful
 */
void printdz(DemandZone *dz) {
	printf("DZ: x = %f, y = %f, w = %f, h = %f, v = %f\n", dz->x, dz->y, dz->w, dz->h, dz->v);
}

/**
 * Print an SZ to stdout
 */
void printsz(ServiceZone *sz) {
	printf("SZ: x = %f, y = %f, w = %f, h = %f\n", sz->x, sz->y, sz->w, sz->h);
}	

/**
 * Calculate the reward for an SZ with respect to a specific DZ
 */
float reward(ServiceZone *sz, DemandZone *dz) {
	float w = fmin(sz->x + sz->w, dz->x + dz->w) - fmax(sz->x, dz->x);
	float h = fmin(sz->y + sz->h, dz->y + dz->h) - fmax(sz->y, dz->y);
	if (!floatpos(w) || !floatpos(h)) {
		return 0;
	}
	return dz->v * w * h;
}

/**
 * Set the SSP up to be solved by calculating the list of inner y-points,
 * the list of x points, a map which maps a point to associated indices of a
 * DZ for which it is an inner point, and a map which maps a point to the
 * associated indices of the DZs for which it is an outer point
 */
void setup(SSP *ssp, PointList *yi, PointList *l, IndexMap *ix, IndexMap *ox) {
	float ws = ssp->sz.w, hs = ssp->sz.h, wd, xd;
	PointListNode *cur = NULL;
	IndexMapping *mapping = NULL;
	for (int i = 0; i < ssp->zones; i++) {
		// Add the interior y-values
		pladd(yi, ssp->dzs[i].y);
		pladd(yi, ssp->dzs[i].y + ssp->dzs[i].h - hs);
		cur = *l;
		// Add the interior and exterior x-values
		xd = ssp->dzs[i].x;
		wd = ssp->dzs[i].w;
		pladd(l, xd - ws);
		pladd(l, xd);
		cur = pladd(l, xd + wd - ws);
		pladd(l, xd + wd);
		// Add to interior mapping
		imadd(ix, ssp->dzs[i].x, i);
		imadd(ix, ssp->dzs[i].x + ssp->dzs[i].w - ws, i);
		// Add to exterior mapping
		imadd(ox, ssp->dzs[i].x - ws, i);
		imadd(ox, ssp->dzs[i].x + ssp->dzs[i].w, i);
	}
}

/**
 * Calculate the solution to a given SSP.  The SZ of the SSP input wil be
 * modified so that its coordinates are the optimal coordinates.  Returns the
 * total reward of the SZ
 */
float solvessp(SSP *ssp) {
	ServiceZone *sz = &(ssp->sz);
	PointList *yis = newpl(), *l = newpl();
	IndexMap *ix = newim(), *ox = newim();
	setup(ssp, yis, l, ix, ox);
	float c = 0, y, phi, m, lk, ws = ssp->sz.w, xs, ys;
	PointListNode *ycur = *yis, *xcur = NULL;
	IndexList oind, iind;
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
				m += reward(sz, &(ssp->dzs[oind->value])) / ws;
				oind = oind->next;
			}
			iind = evaluate(ix, lk);
			while (iind != NULL) {
				sz->x = ssp->dzs[iind->value].x;
				m -= reward(sz, &(ssp->dzs[iind->value])) / ws;
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
	plfree(yis);
	plfree(l);
	imfree(ix);
	imfree(ox);
	return totalreward(ssp);
}

/**
 * Deallocate an SSP and the associated list of DZs
 */
void sspfree(SSP *ssp) {
	free(ssp->dzs);
	free(ssp);
}

/**
 * Check that two SZs are equivalent
 */
int szequals(ServiceZone *sz1, ServiceZone *sz2) {
	return floatequals(sz1->x, sz2->x) && floatequals(sz1->y, sz2->y) && floatequals(sz1->w, sz2->w) && floatequals(sz1->h, sz2->h);
}

/**
 * Calculate the total reward recieved by the SZ in a given SSP
 */
float totalreward(SSP *ssp) {
	float t = 0;
	for (int i = 0; i < ssp->zones; i++) {
		t += reward(&(ssp->sz), &(ssp->dzs[i]));
	}
	return t;
}