#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
void insert();
int finder(int fkod);
void readnumber(int* number);

typedef struct Auto{
    char rendszam[7];
    char tipus[20];
    int ar;
}Auto;

void readnumber(int* number) {
    char ch;
    bool ok;
    do {
        ok = true;
        if (*number < 0)
        {
            printf("Hibas input\n");
            ok = false;
        }

    } while(!ok);
}

int main()
{
    int db;
    char c;
    do {
        printf("Mennyi rekord?");
        scanf("%d", &db);
    } while ((c=getchar()) != '\n' && c != EOF);

    for(int i = 0; i <db; i++) {
        insert();
    }

    do {
        printf("Hanyadik rekord?");
        scanf("%d", &db);
    } while ((c=getchar()) != '\n');
    finder(db);

    return 0;
}

void insert() {
    FILE *fp;
    Auto car;
    char fnev[50];
    char ch;

    fp = fopen("munka.txt", "ab");
    if(fp == NULL) {
        printf("Error.\n");
        exit(0);
    }
    do {
        printf("\nRendszam: ");
        scanf("%d", car.rendszam);
        printf("\nTipus: ");
        scanf("%[^\n]s", car.tipus);
        printf("\nAra: ");
        scanf("%d", &car.ar);
    }  while((ch=getchar()) != '\n');

    fwrite(&car, sizeof(Auto), 1, fp);
    printf("Irasra kesz.");
    fclose(fp);
}


int finder(int fkod) {
    FILE *fp;
    Auto car;
    int i, filesize;
    bool ok = false;
    fp=fopen("munka.txt", "rb");
    if(!fp) {
        printf("Error.");
        return -1;
    }

    fseek(fp, 0L, SEEK_END);
    filesize = ftell(fp)/sizeof(Auto);

    for(i = 0; i < filesize; i++) {
        fseek(fp, sizeof(Auto)*i,SEEK_SET);
        fread(&car,sizeof(Auto),1,fp);
        if (i == fkod) {
            printf("\nLetezo kod, asszocialt adat:");
            printf("\nRendszan: %s, Tipus: %s, Ara: %d", car.rendszam, car.tipus, car.ar);
        }
    }
    if (ok == false) {
        printf("\nNincs ilyen adat: %d", fkod);
    }
    fclose(fp);
    return 0;

}
