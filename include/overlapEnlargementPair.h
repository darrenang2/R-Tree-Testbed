#ifndef OVERLAPENLARGEMENTPAIR_H
#define OVERLAPENLARGEMENTPAIR_H

typedef struct {
    int index = -1;
    int overlapEnlargement = -1;
} overlapEnlargementPair;

bool compare(overlapEnlargementPair a, overlapEnlargementPair b);
void swap(overlapEnlargementPair *xp, overlapEnlargementPair *yp);
void sort(overlapEnlargementPair arr[], int n);

#endif // OVERLAPENLARGEMENTPAIR_H