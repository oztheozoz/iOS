//
//  main.m
//  TestClass
//
//  Created by Osbert Orr on 10/18/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Ivars2.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Ivars *aIvar = [[Ivars alloc] init];
        [aIvar testPublicOsbert];
        Ivars2 *aIvar2 = [[Ivars2 alloc] init];
        [aIvar2 testPublicOsbert];
        [aIvar2 testIvars2];
    }
    return 0;
}
