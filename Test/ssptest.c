#ifndef SSP_H
#include "..\src\ssp.h"
#endif

void printSSP(SSP *ssp) {
	printsz(&(ssp->sz));
	printf("Size: %d\n", ssp->zones);
	for (int i = 0; i < ssp->zones; i++) {
		printdz(&(ssp->dzs[i]));
	}
}

void test1() {
	printf("Test 1: ");
	ServiceZone sz = (ServiceZone) {3, 7, 4, 3};
	SSP *ssp = newssp();
	ssp->sz = (ServiceZone) {0, 0, 4, 3};
	makedzs(ssp, 5);
	ssp->dzs[0] = (DemandZone) {0, 7, 7, 5, 4};
	ssp->dzs[1] = (DemandZone) {1, 0, 5, 10, 6};
	ssp->dzs[2] = (DemandZone) {5, 5, 6, 6, 7};
	ssp->dzs[3] = (DemandZone) {4, 3, 6, 6, 3};
	ssp->dzs[4] = (DemandZone) {9, 2, 6, 5, 10};
	float total = solvessp(ssp) + 0.001;
	if (!szequals(&sz, &ssp->sz)) {
		printf("Failed\nExpected SSP Solution to be:\n");
		printsz(&sz);
		printf("But was:\n");
		printsz(&(ssp->sz));
		exit(-1);
	}
	if (!floatequals(total, 162.0)) {
		printf("Failed\nExpected SSP optimal reward to be (%.2f), but was"
			"(%.2f)\n", 162.0, total);
		exit(-1);
	}
	sspfree(ssp);
	printf("Succeeded\n");
}

void main() {
	test1();
	printf("All tests completed successfully\n");
}