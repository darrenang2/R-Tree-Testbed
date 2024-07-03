#ifndef NODEARRAY_H
#define NODEARRAY_H

#include "node.h"

#define MAX_NODES_PER_LEVEL 10000
#define MAX_LEVELS 10000

static int H = 3; // current height of tree

Node hbm_array[MAX_NODES_PER_LEVEL * MAX_LEVELS];
int nodes_in_level[MAX_LEVELS] = {0};

int get_level_start_index(int level);
Node *get_node(int level, int index);
int get_index(Node *node);
int get_level(Node *node);
void add_node(int level, Node node);
void delete_node(int level, int index);
void print_level(int level);
void print_all_levels();
void clear_all_levels();

#endif // NODEARRAY_H