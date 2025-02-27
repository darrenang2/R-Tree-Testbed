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

void sort(areaEnlargementPair *arr, int n)
{
    bool swapped = false; 
    for (int j = 0; j < n; j++)
    {
        swapped = false;
        for (int i = 0; i < n-1; i++)
        {
            std::cout << "A: " << arr[i].areaEnlargement<< " vs B: " << arr[i + 1].areaEnlargement << std::endl;
            if (arr[i].areaEnlargement > arr[i + 1].areaEnlargement)
            {
                areaEnlargementPair temp = arr[i];
                arr[i] = arr[i + 1];
                arr[i + 1] = arr[i];

            }
       }

        if (!swapped) {
            break; 
        }


    }
}