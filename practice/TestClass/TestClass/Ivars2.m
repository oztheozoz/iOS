//
//  Ivars2.m
//  TestClass
//
//  Created by Osbert Orr on 10/18/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import "Ivars2.h"

@implementation Ivars2
- (void)testIvars2 {
    _testIvarIntPublic = 4;
    
    NSLog(@"_testIvarIntPublic = %d", _testIvarIntPublic);
}
@end
