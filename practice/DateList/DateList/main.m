//
//  main.m
//  DateList
//
//  Created by Osbert Orr on 10/8/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Create three NSDate objects
        NSDate *now = [NSDate date];
        NSDate *tomorrow = [now dateByAddingTimeInterval:24.0 * 60.0 * 60.0];
        NSDate *yesterday = [now dateByAddingTimeInterval:-24.0 * 60.0 * 60.0];
        
        // Create an array containing all three
        NSArray *dateList = @[now, tomorrow, yesterday];
        
        // Print a couple of dates
        NSLog(@"The first date is %@", dateList[0]);
        NSLog(@"The third date is %@", dateList[2]);
        
        // How many dates are in the array?
        NSLog(@"There are %lu dates", [dateList count]);
        
    }
    return 0;
}
