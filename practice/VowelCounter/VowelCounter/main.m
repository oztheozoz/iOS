//
//  main.m
//  VowelCounter
//
//  Created by Osbert Orr on 10/13/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+BNRVowelCounting.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *string = @"Hello World";
        NSLog(@"%@ has %d vowels", string, [string bnr_vowelCount]);
    }
    return 0;
}
