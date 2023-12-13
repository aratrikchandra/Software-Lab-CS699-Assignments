#include <stdio.h>
#include "customFunction.h"

int main() {
    printf("Running programEntry.c\n");
    int a = 7, b = 8;
    printf("%d ,%d", sum(a, b),mul(a, b));
    return 0;
}