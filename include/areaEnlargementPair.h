#ifndef AREAENLARGEMENTPAIR_H
#define AREAENLARGEMENTPAIR_H

typedef struct 
{
    int index;
    int areaEnlargement;
} areaEnlargementPair;

bool compare(areaEnlargementPair a, areaEnlargementPair b);
void swap(areaEnlargementPair *xp, areaEnlargementPair *yp);
void sort(areaEnlargementPair arr[], int n);

#endif