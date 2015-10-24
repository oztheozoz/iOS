//
//  BNRObserver.m
//  Callbacks
//
//  Created by Osbert Orr on 10/13/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRObserver.h"

@implementation BNRObserver
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    NSString *oldValue = [change objectForKey:NSKeyValueChangeOldKey];
    NSString *newValue = [change objectForKey:NSKeyValueChangeNewKey];
    NSLog(@"Observed: %@ of %@ was changed from %@ to %@", keyPath, object, oldValue, newValue);
}
@end
