//
//  Ivars.m
//  TestClass
//
//  Created by Osbert Orr on 10/18/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import "Ivars.h"
@interface Ivars(){
    int _testIvarIntPrivate;
}
@property (nonatomic) int testIntPrivate;
@end

@implementation Ivars
- (void)testPrivateOsbert {
    NSLog(@"Hello World!");
    NSLog(@"testIntPrivate %d", self.testIntPrivate);
    NSLog(@"_testIvarIntPrivate %d", _testIvarIntPrivate);
}

- (void)testPublicOsbert {
    self.testIntPrivate = 1;
    _testIvarIntPrivate = 2;
    [self testPrivateOsbert];
}
@end
