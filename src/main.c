#ifndef SSP_H
#include "ssp.h"
#endif

#define TAB_LEN 8

/**
 *
 * Internal functions for file reading.
 * These are trown together without regard for security, so don't use these in
 * an application!
 *
 */

/**
 * Get the next line in a file without moving the filestream position.
 * Returns a string of the characters until either the first newline
 * (not including the first character) or EOF is reached.
 */
int nextLine(FILE *fp, char *str) {
	memset(str, '\0', 50);
	int pos = ftell(fp), i = 0;
	char c = fgetc(fp);
	do {
		str[i] = c;
		c = fgetc(fp);
		i += 1;
	} while (c != '\n' && i < 50);
	fseek(fp, pos, SEEK_SET);
	return pos;
}

/**
 * Create the string indicating the position of the error. Assumes errStr
 * is blank.
 */
void makeErrorString(char *errStr, char *str, int errPos) {
	int newLine = 0, tab = 0;
	if (errPos >= 50) {
		exit(-1);
	}
	if (str[0] == '\n') {
		newLine = 1;
	}
	if (str[newLine] == '\t') {
		errStr[0] = '\t';
		tab = 1;
	}
	// Fil with spaces
	if (errPos > 0) {
		memset(&errStr[tab], ' ', errPos - tab);
	}
	errStr[errPos] = '^';
}

void makeLineString(char *line, const char *str) {
	memset(line, '\0', 50);
	int maxLen = 0, length = 0, i = 0;
	char c;
	while (i < strlen(str)) {
		c = str[i];
		if (c == '\t') {
			length += TAB_LEN;
		}
		else if (c == '\n') {
			length = 0;
		}
		else {
			length += 1;
		}
		if (length > maxLen) {
			maxLen = length;
		}
		i += 1;
	}
	i = 0;
	while (i < maxLen) {
		line[i] = '-';
		i += 1;
	}
}

char nextChar(FILE *fp) {
	char c = getc(fp);
	ungetc(c, fp);
	return c;
}

void readVar(FILE *fp, char varName, float *loc, int *curLine, char *str, char *errStr) {
	int pos = nextLine(fp, str);
	char fStr[50], line1[50], line2[50];
	memset(fStr, '\0', 50);
	snprintf(fStr, 9, "\n\t%c = %%f", varName);
	if (fscanf(fp, fStr, loc) != 1 || nextChar(fp) != '\n') {
		pos = ftell(fp) - pos;
		makeErrorString(errStr, str, pos - 2);
		makeLineString(line1, str);
		makeLineString(line2, errStr);
		fprintf(stderr, "Unexpected Input (line %d):\n%s\n%s\n%s\n%s\nExpected:\n%s\n%s\n%s\n", *curLine, line1, str, errStr, line1, line2, fStr, line2);
		exit(-1);
	}
	*curLine += 1;
}

void readText(FILE *fp, const char *text, int *curLine) {
	int i = 0, len = strlen(text);
	char c = 0;
	char line1[50], line2[50], str[50];
	memset(str, '\0', 50);
	fread(str, sizeof(char), len, fp);
	while (i < len) {
		if (str[i] != text[i]) {
			makeLineString(line1, str);
			makeLineString(line2, text);
			fprintf(stderr, "Unexpected input (line %d):\n%s\n%s\n%s\nExpected:\n%s\n%s\n%s\n", curLine, line1, str, line1, line2, text, line2);
			exit(-1);
		}
		else if (str[i] == '\n') {
			*curLine += 1;
		}
		i += 1;
	}
}

/**
 * Rough function for reading input file.  Not the most secure, but gets the
 * job done.
 */

void readssp(SSP *ssp, FILE *fp) {
	int pos = 0, zones = 0, curLine = 0;
	char c = 0;
	char str[50], errStr[50], line1[50], line2[50];
	memset(str, '\0', 50);
	memset(errStr, '\0', 50);
	readText(fp, "SZ {", &curLine);
	readVar(fp, 'w', &(ssp->sz.w), &curLine, str, errStr);
	readVar(fp, 'h', &(ssp->sz.h), &curLine, str, errStr);
	readText(fp, "\n}", &curLine);
	// Get the file position immediately after the SZ
	pos = ftell(fp);
	// Get the number of lines containing the DZs
	c = getc(fp);
	while (!feof(fp)) {
		if (c == 'D' && getc(fp) == 'Z') {
			zones += 1;
		}
		c = getc(fp);
	}
	ssp->zones = zones;
	makedzs(ssp, zones);
	fseek(fp, pos, SEEK_SET);
	for (int i = 0; i < zones; i++) {
		pos = ftell(fp);
		readText(fp, "\n\nDZ {", &curLine);
		readVar(fp, 'x', &(ssp->dzs[i].x), &curLine, str, errStr);
		readVar(fp, 'y', &(ssp->dzs[i].y), &curLine, str, errStr);
		readVar(fp, 'w', &(ssp->dzs[i].w), &curLine, str, errStr);
		readVar(fp, 'h', &(ssp->dzs[i].h), &curLine, str, errStr);
		readVar(fp, 'v', &(ssp->dzs[i].v), &curLine, str, errStr);
		readText(fp, "\n}", &curLine);
	}
}

void main(int argc, char* argv[]) {
	const char* filename = argv[1];
	SSP *ssp = newssp();
	FILE *fp = fopen(filename, "r");
	if (fp == NULL) {
		fprintf(stderr, "Could not find/open file: %s\nMake sure file is accessible and is not being used by another program\n", filename);
	}
	readssp(ssp, fp);
	float reward = solvessp(ssp);
	printsz(&(ssp->sz));
	printf("Optimal Reward: %f\n", reward);
	fclose(fp);
	free(ssp);
}