//
//  main.c
//  CountDown
//
//  Created by Osbert Orr on 7/10/2015.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <readline/readline.h>

void startCounting(int num) {
    int nextNumber = num;
    for(int i = num; i >= 0; i--) {
        if(i == nextNumber) {
            printf("%d\n", i);
            if(i % 5 == 0) {
                printf("Found one!\n");
            }
            nextNumber -= 3;
        }
    }
}

int main(int argc, const char * argv[]) {
    printf("What number do you want to count down from? ");
    const char *cNum = readline(NULL);
    int num;
    
    if((num = atoi(cNum))) {
        startCounting(num);
    }

    return 0;
}


