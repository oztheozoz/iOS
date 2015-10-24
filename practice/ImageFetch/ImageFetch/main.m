//
//  main.m
//  ImageFetch
//
//  Created by Osbert Orr on 10/11/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSURL *url = [NSURL URLWithString:@"http://www.google.com/images/logos/ps_logo2.png"];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSError *error = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:NULL error:&error];
        
        if(!data) {
            NSLog(@"fetch failed: %@", [error localizedDescription]);
            return 1;
        }
        
        NSLog(@"The file is %lu bytes", (unsigned long)[data length]);
        BOOL written = [data writeToFile:@"/tmp/google.png"
                                 options:0
                                   error:&error];
        
        if(!written) {
            NSLog(@"write failed: %@", [error localizedDescription]);
            return 1;
        }
        NSLog(@"Success!");
        
        NSData *readData = [NSData dataWithContentsOfFile:@"/tmp/google.png"];
        NSLog(@"The file read from the disk has %lu bytes", (unsigned long)[readData length]);
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSMoviesDirectory, NSUserDomainMask, YES);
        for(NSString *path in paths) {
            NSLog(@"Path: %@", path);
        }
    }
    return 0;
}
