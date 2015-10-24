//
//  main.m
//  Callbacks
//
//  Created by Osbert Orr on 10/12/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRLogger.h"
#import "BNRObserver.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BNRLogger *logger = [[BNRLogger alloc] init];
        [[NSNotificationCenter defaultCenter] addObserverForName:NSSystemTimeZoneDidChangeNotification object:nil queue:nil usingBlock:^(NSNotification * note) {
            NSLog(@"The oz system time zone has changed!");
        }];
        
        NSURL *url = [NSURL URLWithString:@"http://www.gutenberg.org/cache/epub/205/pt205.txt"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        __unused NSURLConnection *fetchConn = [[NSURLConnection alloc] initWithRequest:request delegate:logger startImmediately:YES];
        __unused NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:logger selector:@selector(updateLastTime:) userInfo:nil repeats:YES];
        
        __unused BNRObserver *observer = [[BNRObserver alloc] init];
        
        [logger addObserver:observer forKeyPath:@"lastTimeString" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
        
        [[NSRunLoop currentRunLoop] run];
    }
    return 0;
}
