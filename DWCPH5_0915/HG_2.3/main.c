#include <stdio.h>
#include <stdlib.h>

int main()
{
    FILE *fptr1, *fptr2;
    char filename[100], c;

    printf("A m�soland� file neve: \n");
    scanf("%s", filename);

    fptr1 = fopen(filename, "r");
    if (fptr1 == NULL)
    {
        printf("Cannot open file %s \n", filename);
        exit(0);
    }

    printf("A m�sol�s c�lja: \n");
    scanf("%s", filename);

    fptr2 = fopen(filename, "w");
    if (fptr2 == NULL)
    {
        printf("Cannot open file %s \n", filename);
        exit(0);
    }

    c = fgetc(fptr1);
    while (c != EOF)
    {
        fputc(c, fptr2);
        c = fgetc(fptr1);
    }

    printf("\nTartalom �tm�solva %s", filename);

    fclose(fptr1);
    fclose(fptr2);
    return 0;
}
