#include "overlapEnlargementPair.h"

bool compare(overlapEnlargementPair a, overlapEnlargementPair b)
{
    return a.overlapEnlargement < b.overlapEnlargement;
}

void swap(overlapEnlargementPair *xp, overlapEnlargementPair *yp)
{
    overlapEnlargementPair temp = *xp;
    *xp = *yp;
    *yp = temp;
}

void sort(overlapEnlargementPair arr[], int n)
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