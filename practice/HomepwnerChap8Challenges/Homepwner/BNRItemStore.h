//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Osbert Orr on 10/22/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BNRItem;

@interface BNRItemStore : NSObject
@property (nonatomic, readonly, copy) NSArray *allItems;
+ (instancetype)sharedStore;
- (BNRItem *)createItem;
@end
