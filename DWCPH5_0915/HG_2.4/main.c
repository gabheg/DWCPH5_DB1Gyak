#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct car {
    char *plate;
    char *type;
    int price;
};

int createBinFile(char *fname) {
	FILE *fp;
	struct car newrecord;

	// Open for binary writing
	fp=fopen(fname,"wb");
	if (!fp) {
		printf("Unable to open file!");
		return -1;
	}

	// Just write three records, so we have
	// something to play with. Normally you would
	// do this with a loop and/or user input!

	newrecord.plate="AAA BBB";
	newrecord.type="F";
	newrecord.price=1000;
	fwrite(&newrecord, sizeof(struct car), 1, fp);

	newrecord.plate="CCC DDD";
	newrecord.type="G";
	newrecord.price=10000;
	fwrite(&newrecord, sizeof(struct car), 1, fp);

	newrecord.plate="EEE FFF";
	newrecord.type="H";
	newrecord.price=10000;
	fwrite(&newrecord, sizeof(struct car), 1, fp);

	fclose(fp);
	return 0;
}

int readBinFile(char *fname) {
	FILE *fp;
	struct car myrecord;

	fp=fopen(fname,"rb");
	if (!fp) {
		printf("Unable to open file!");
		return -1;
	}

	printf("The following records are in the binary file %s:\n", fname);
	while (fread(&myrecord,sizeof(struct car),1,fp) != NULL) {
		printf("%s\n", myrecord.plate);
		printf("%s\n", myrecord.type);
		printf("%d\n\n", myrecord.price);
	}
	fclose(fp);
	return 0;
}

int main() {
	int result, errno;

	// Setup a new file on each run.
	result = createBinFile("test.bin");
	if(result == -1) {
		perror("Error creating bin file!");
		exit(1);
	}

	result = readBinFile("test.bin");
	if(result == -1) {
		perror("Error reading bin file!");
		exit(1);
	}

	return 0;
}
