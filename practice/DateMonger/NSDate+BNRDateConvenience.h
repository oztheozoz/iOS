//
//  NSDate+BNRDateConvenience.h
//  DateMonger
//
//  Created by Osbert Orr on 10/13/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (BNRDateConvenience)
+ (NSDate *)bnr_getDate:(int)year month:(int)month day:(int)day;
@end
