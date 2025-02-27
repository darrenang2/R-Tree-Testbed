#ifndef AREAENLARGEMENTPAIR_H
#define AREAENLARGEMENTPAIR_H

#include <iostream>

typedef struct 
{
    int index = -1;
    int areaEnlargement = -1;
} areaEnlargementPair;

bool compare(areaEnlargementPair a, areaEnlargementPair b);
void swap(areaEnlargementPair *xp, areaEnlargementPair *yp);
void sort(areaEnlargementPair *arr, int n);

#endif