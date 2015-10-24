//
//  main.c
//  TwoFloats
//
//  Created by Osbert Orr on 7/10/2015.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    float flo1 = 3.14;
    float flo2 = 42.0;
    double sum = flo1 + flo2;
    
    printf("Result of addition of 2 floats: %f", sum);
    
    return 0;
}
