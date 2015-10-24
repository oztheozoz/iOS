//
//  BNREmployee.m
//  BMITime
//
//  Created by Osbert Orr on 10/8/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNREmployee.h"
#import "BNRAsset.h"
@interface BNREmployee()
{
    NSMutableSet *_assets;
}
@end

@implementation BNREmployee
- (double)yearsOfEmployment {
    if(self.hireDate) {
        NSDate *now = [NSDate date];
        NSTimeInterval secs = [now timeIntervalSinceDate:self.hireDate];
        return secs/31557600.0;
    } else {
        return 0;
    }
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<Employee %u: $%u in assets>", self.employeeID, self.valueOfAssets];
}

- (void)setAssets:(NSArray *)assets {
    _assets = [assets mutableCopy];
}

- (NSArray *)assets {
    return [_assets copy];
}

- (void)addAsset:(BNRAsset *)a {
    if(!_assets) {
        _assets = [[NSMutableSet alloc] init];
    }
    
    [_assets addObject:a];
    a.holder = self;
}

- (unsigned int)valueOfAssets {
    unsigned int sum = 0;
    
    for(BNRAsset *a in _assets) {
        sum += [a resaleValue];
    }
    
    return sum;
}

- (void)dealloc {
    NSLog(@"deallocating %@", self);
}
@end
