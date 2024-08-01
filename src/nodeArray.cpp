#include "nodeArray.h"

// Function to get the starting index of a level
int get_level_start_index(int level)
{
    return MAX_NODES_PER_LEVEL * level;
}

// Function to access a node at a specific level and index within that level
Node *get_node(int level, int index)
{
    int start_index = get_level_start_index(level);
    return &hbm_array[start_index + index];
}

// Function to access a node at a specific index in the array
Node *get_node(int index)
{
    return &hbm_array[index];
}

void set_node(int index, Node node)
{
    hbm_array[index] = node;
}

// Function to set a node at a specific level and index within that level
void set_node(int level, int index, Node node)
{
    int start_index = get_level_start_index(level);
    hbm_array[start_index + index] = node;
}

int get_index(Node *node)
{
    return node - hbm_array;
}

int get_level(Node *node)
{
    return (get_index(node) / MAX_NODES_PER_LEVEL);
}

// Function to add a node to a specific level and append it at the end of the level
void add_node(int level, Node node)
{
    int node_index = nodes_in_level[level];
    if (node_index >= MAX_NODES_PER_LEVEL)
    {
        printf("Error: Level %d is full.\n", level);
        return;
    }
    int start_index = get_level_start_index(level);
    hbm_array[start_index + node_index] = node;
    nodes_in_level[level]++;
}

// Function to delete a node at a specific level and index within that level
void delete_node(int level, int index)
{
    int start_index = get_level_start_index(level);
    int num_nodes = nodes_in_level[level];
    if (index >= num_nodes)
    {
        printf("Error: Node %d does not exist in level %d.\n", index, level);
        return;
    }
    for (int i = index; i < num_nodes - 1; i++)
    {
        hbm_array[start_index + i] = hbm_array[start_index + i + 1];
    }
    nodes_in_level[level]--;
}

// Function to print all nodes in a level
void print_level(int level)
{
    int start_index = get_level_start_index(level);
    int num_nodes = nodes_in_level[level];
    for (int i = 0; i < num_nodes; i++)
    {
        Node *node = &hbm_array[start_index + i];
        printf("Node %d: leaf=%d, box=(%d, %d, %d, %d), children=[", start_index + i, node->leaf, node->box.minX, node->box.maxX, node->box.minY, node->box.maxY);
        for (int j = 0; j < MAX_CHILDREN; j++)
        {
            printf("%d, ", node->child[j]);
        }
        printf("]\n");
    }
}

// Function to print all nodes in all levels
void print_all_levels()
{
    for (int i = 0; i < MAX_LEVELS; i++)
    {
        printf("Level %d:\n", i);
        print_level(i);
    }
}

// Function to clear all nodes in all levels
void clear_all_levels()
{
    for (int i = 0; i < MAX_LEVELS; i++)
    {
        nodes_in_level[i] = 0;
    }
}

// Function to increase the height of the tree
void increase_height(int h)
{
    H += h;
}