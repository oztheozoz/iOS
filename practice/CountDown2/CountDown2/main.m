//
//  main.m
//  CountDown2
//
//  Created by Osbert Orr on 10/8/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <readline/readline.h>

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
    
    
    @autoreleasepool {
        NSLog(@"What number do you want to count down from?");
        NSString *cNum = [NSString stringWithUTF8String:readline(NULL)];
        
        int num;
        
        if((num = [cNum intValue])) {
            startCounting(num);
        }
    }
    return 0;
}
