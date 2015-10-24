//
//  main.m
//  Groceries
//
//  Created by Osbert Orr on 10/8/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *list = [[NSMutableArray alloc] init];
        [list addObject:@"Loaf of bread"];
        [list addObject:@"Container of milk"];
        [list addObject:@"Stick of butter"];
        
        for(NSString *item in list) {
            NSLog(@"Item: %@", item);
        }
    }
    return 0;
}
