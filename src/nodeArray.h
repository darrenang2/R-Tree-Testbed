#ifndef NODEARRAY_H
#define NODEARRAY_H

#include "node.h"

#define MAX_NODES_PER_LEVEL 100
#define MAX_LEVELS 100

static int H = 2; // current height of root node - 1 (leaves are at level 0)

static Node hbm_array[MAX_NODES_PER_LEVEL * MAX_LEVELS];
static int nodes_in_level[MAX_LEVELS] = {0};

int get_level_start_index(int level);
Node *get_node(int level, int index);
Node *get_node(int index);
void set_node(int index, Node node);
void set_node(int level, int index, Node node);
int get_index(Node *node);
int get_level(Node *node);
void add_node(int level, Node node);
void delete_node(int level, int index);
void print_level(int level);
void print_all_levels();
void clear_all_levels();
void increase_height(int h);
void reinsert_under(int level);

#endif // NODEARRAY_H