//
//  main.c
//  Addresses
//
//  Created by Osbert Orr on 7/10/2015.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    int i = 17;
    printf("i stores its value at %p\n", &i);
    printf("this function starts at %p\n", main);
    
    int *addressOfI = &i;
    printf("the int stored at addressOfI is %d\n", *addressOfI);
    *addressOfI = 89;
    printf("Now i is %d\n", i);
    printf("An int is %zu bytes\n", sizeof(int));
    printf("A pointer is %zu bytes\n", sizeof(int *));
    
    printf("A float is %zu bytes\n", sizeof(float));
    return 0;
}
