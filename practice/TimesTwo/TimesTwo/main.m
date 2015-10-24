//
//  main.m
//  TimesTwo
//
//  Created by Osbert Orr on 8/10/2015.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDate *currentTime = [NSDate date];
        NSLog(@"currentTime's value is %p", currentTime);
        
        NSDate *startTime = currentTime;
        
        sleep(2);
        
        currentTime = [NSDate date];
        NSLog(@"currentTime's value is %p", currentTime);
        NSLog(@"The address of the original object is %p", startTime);
    }
    return 0;
}
