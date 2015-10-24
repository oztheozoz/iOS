//
//  BNRAsset.m
//  BMITime
//
//  Created by Osbert Orr on 10/8/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRAsset.h"
#import "BNREmployee.h"

@implementation BNRAsset
- (NSString *)description {
    if(self.holder) {
        return [NSString stringWithFormat:@"<%@: $%d, assigned to %@", self.label, self.resaleValue, self.holder];
    } else {
        return [NSString stringWithFormat:@"<%@: $%d unassigned>", self.label, self.resaleValue];
    }
}

- (void)dealloc {
    NSLog(@"deallocating %@", self);
}
@end
