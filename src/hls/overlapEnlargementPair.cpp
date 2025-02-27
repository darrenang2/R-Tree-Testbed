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

void sort(overlapEnlargementPair* arr, int n)
{   
    bool swapped = false; 
    for (int j = 0; j < n; j++)
    {
        swapped = false;
        for (int i = 0; i < n-1; i++)
        {
            std::cout << "A: " << arr[i].overlapEnlargement<< " vs B: " << arr[i + 1].overlapEnlargement << std::endl;
            if (arr[i].overlapEnlargement > arr[i + 1].overlapEnlargement)
            {
                overlapEnlargementPair temp = arr[i];
                arr[i] = arr[i + 1];
                arr[i - 1] = arr[i];
                swapped = true; 
            }
        }

        if (!swapped) {
            break; 
        }


    }
}