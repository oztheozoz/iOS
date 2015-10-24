//
//  main.c
//  BitWiseChallenge
//
//  Created by Osbert Orr on 10/14/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#include <stdio.h>

void outputBits(unsigned long number) {
    unsigned long helperNumber = 1;
    printf("outputBits\n");
    for(int i = sizeof(unsigned long) * 8 - 1; i >= 0; i--) {
        (number&(helperNumber<<i)) ? putchar('1') : putchar('0');
    }
    
    printf("\n");
}

int main(int argc, const char * argv[]) {
    unsigned long number = 0;
    unsigned long helperNumber = 1;
    for(int i = 0; i < sizeof(unsigned long) * 8; i++) {
        if (i % 2 == 0) {
            number |= helperNumber;
        }
        helperNumber <<= 1;
    }
    
    outputBits(number);
    
    printf("number = %lu\n", number);
    return 0;
}
