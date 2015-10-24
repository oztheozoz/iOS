//
//  main.m
//  SecondsAlive
//
//  Created by Osbert Orr on 8/10/2015.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        [comps setYear:1990];
        [comps setMonth:4];
        [comps setDay:1];
        [comps setHour:2];
        [comps setMinute:0];
        [comps setSecond:0];
        
        NSCalendar *g = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDate *dateOfBirth = [g dateFromComponents:comps];
        NSDate *now = [NSDate date];
        double secondsSinceEarlierDate = [now timeIntervalSinceDate:dateOfBirth];
        NSLog(@"seconds since %@ is %.0f", now, secondsSinceEarlierDate);
    }
    return 0;
}
