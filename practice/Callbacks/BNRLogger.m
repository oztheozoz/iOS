//
//  BNRLogger.m
//  Callbacks
//
//  Created by Osbert Orr on 10/12/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRLogger.h"
@interface BNRLogger()
- (void)zoneChange:(NSNotification *)note;
@end

@implementation BNRLogger
- (NSString *)lastTimeString {
    static NSDateFormatter * dateFormatter = nil;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        NSLog(@"created dateFormater");
    }
    return [dateFormatter stringFromDate:self.lastTime];
}

- (void)updateLastTime:(NSTimer *)t {
    NSDate *now = [NSDate date];
    [self setLastTime:now];
    NSLog(@"Just set time to %@", self.lastTimeString);
}

// Called each time a chunk of data arrives
- (void)connection:(NSURLConnection *)connection didReceiveData:(nonnull NSData *)data {
    NSLog(@"received %lu bytes", [data length]);
    
    if(!_incomingData) {
        _incomingData = [[NSMutableData alloc] init];
    }
    
    [_incomingData appendData:data];
}

// Called when the last chunk has been processed
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"Got it all!");
    
    NSString *string = [[NSString alloc] initWithData:_incomingData encoding:NSUTF8StringEncoding];
    
    _incomingData = nil;
    NSLog(@"string has %lu characters", [string length]);
    
    // Uncomment the next line to see the entire fetched file
    NSLog(@"The whole string is %@", string);
}

// called if the fetch failes
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"connection failed: %@", [error localizedDescription]);
    _incomingData = nil;
}

- (void)zoneChange:(NSNotification *)note {
    NSLog(@"The system time zone has changed!");
}

+ (NSSet *)keyPathsForValuesAffectingLastTimeString {
    return [NSSet setWithObject:@"lastTime"];
}
@end
