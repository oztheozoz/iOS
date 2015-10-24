//
//  main.m
//  Test
//
//  Created by Osbert Orr on 10/15/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
void printBits(int64_t num) {
    int64_t mask = 1;
    
    for(int i = sizeof(num) * 8 - 1; i >= 0; i--) {
        (num&(mask<<i)) ? putchar('1') : putchar('0');
    }
    putchar('\n');
}

void printBits2(char num) {
    char mask = 1;
    
    for(int i = sizeof(num) * 8 - 1; i >= 0; i--) {
        (num&(mask<<i)) ? putchar('1') : putchar('0');
    }
    putchar('\n');
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int64_t num = 34934902384237;
        printBits(num);
        
        NSData *testData = [NSData dataWithBytes:&num length:sizeof(int64_t)];
        [testData enumerateByteRangesUsingBlock:^(const void * bytes, NSRange byteRange, BOOL *stop) {
            NSLog(@"byteRange.length = %lu", byteRange.length);
            /*
            for(int i = 0; i < byteRange.length; i++) {
                NSLog(@"byte %d = %@", i, bytes[i]);
            }
             */
        }];
    }
    return 0;
}
