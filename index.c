#include <stdio.h>

typedef struct {
    int a;
    int b;
}inter;

/*returns 1*/
int test(){
    return 1;
}

int main() {
    inter a;

    a.a = 1;
    a.b = 2;
    printf("1");

    return 0;
}
