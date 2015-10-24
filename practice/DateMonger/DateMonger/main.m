//
//  main.m
//  DateMonger
//
//  Created by Osbert Orr on 10/13/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDate+BNRDateConvenience.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDate *date = [NSDate bnr_getDate:1999 month:7 day:10];
        NSDate *now = [NSDate date];
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        [df setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
        NSLog(@"%@", [df stringFromDate:date]);
    }
    return 0;
}
