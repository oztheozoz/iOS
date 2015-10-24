//
//  main.c
//  Numbers
//
//  Created by Osbert Orr on 7/10/2015.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    unsigned long x = 255;
    printf("x is %lu.\n", x);
    printf("In octal, x is %lo.\n", x);
    printf("In hexadecimal, x is %lx.\n", x);
    
    return 0;
}
