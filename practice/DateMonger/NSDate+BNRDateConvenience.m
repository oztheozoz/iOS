//
//  NSDate+BNRDateConvenience.m
//  DateMonger
//
//  Created by Osbert Orr on 10/13/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import "NSDate+BNRDateConvenience.h"

@implementation NSDate (BNRDateConvenience)
+ (NSDate *)bnr_getDate:(int)year month:(int)month day:(int)day {
    NSLog([NSString stringWithFormat:@"%d-%d-%d 00:00:00", year, month, day]);
    return [NSDate dateWithString:[NSString stringWithFormat:@"%d-%d-%d 00:00:00 +0000", year, month, day]];
}
@end
