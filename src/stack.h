#ifndef STACK_H
#define STACK_H

#include <iostream>

#define MAX 100 // MAX NUMBER OF NODES

class Stack {
private:
    int top;
    int a[MAX];

public:
    Stack() : top(-1) {}

    bool push(int x) {
        if (top >= (MAX - 1)) {
            std::cout << "Stack Overflow\n";
            return false;
        } else {
            a[++top] = x;
            std::cout << x << " pushed into stack\n";
            return true;
        }
    }

    int pop() {
        if (top < 0) {
            std::cout << "Stack Underflow\n";
            return 0;
        } else {
            int x = a[top--];
            return x;
        }
    }

    int peek() {
        if (top < 0) {
            std::cout << "Stack is Empty\n";
            return 0;
        } else {
            int x = a[top];
            return x;
        }
    }

    bool isEmpty() {
        return (top < 0);
    }

    void printStack() {
        for (int i = 0; i <= top; i++) {
            std::cout << a[i] << " ";
        }
        std::cout << std::endl;
    }
};

#endif // STACK_H
