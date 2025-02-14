#ifndef HELPER_H
#define HELPER_H

#include <stdio.h>
#include "node.h"
#include <vector>
#include <cmath>
#include <cstdlib>
#include <float.h>

int *search(int minX, int maxX, int minY, int maxY, int *output);
void sortByAreaEnlargement(Node newNode);
void sortByOverlapEnlargement(Node newNode);
int chooseSubTree(Node node);
Node split(Node *node);
void reinsert(Node *node);
Node overflowTreatment(Node *node, bool firstInsert);
void insert(Node *newNode, bool firstInsert);
void deleteNode(Node node);
void remove(int level, int index);

#endif // HELPER_H