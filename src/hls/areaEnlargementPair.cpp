#include "areaEnlargementPair.h"

bool compare(areaEnlargementPair a, areaEnlargementPair b)
{
    return a.areaEnlargement < b.areaEnlargement;
}

void swap(areaEnlargementPair *xp, areaEnlargementPair *yp)
{
    areaEnlargementPair temp = *xp;
    *xp = *yp;
    *yp = temp;
}

void sort(areaEnlargementPair arr[], int n)
{
    for (int j = 0; j < n; j++)
    {
        for (int i = 1; i < n; i++)
        {
            if (compare(arr[i], arr[i - 1]))
            {
                swap(&arr[i], &arr[i - 1]);
            }
        }
    }
}