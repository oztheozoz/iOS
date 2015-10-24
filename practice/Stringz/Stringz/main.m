//
//  main.m
//  Stringz
//
//  Created by Osbert Orr on 10/10/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableString *str = [[NSMutableString alloc] init];
        for(int i = 0; i < 10; i++) {
            [str appendString:@"Aaron is cool!\n"];
        }
        
        NSError *error;
        
        BOOL success = [str writeToFile:@"/tmpdsfsd/cool.txt"
              atomically:YES
                encoding:NSUTF8StringEncoding
                   error:&error];
        
        if(success) {
            NSLog(@"done writing /tmp/cool.txt");
        } else {
            NSLog(@"writing /tmp/cool.txt failed %@", [error localizedDescription]);
        }
        
        
    }
    return 0;
}
