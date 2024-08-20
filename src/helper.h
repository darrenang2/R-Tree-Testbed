#ifndef HELPER_H
#define HELPER_H

#include <stdio.h>
#include "constants.h"
#include "node.h"
#include <vector>
#include <cmath>
#include <cstdlib>
#include <float.h>

data_t *search(data_t minX, data_t maxX, data_t minY, data_t maxY, data_t *output);
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