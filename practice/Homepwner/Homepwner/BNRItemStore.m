//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Osbert Orr on 10/22/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"
@interface BNRItemStore ()
@property (nonatomic) NSMutableArray *privateItems;
@end

@implementation BNRItemStore
+ (instancetype)sharedStore {
    static BNRItemStore *sharedStore;
    
    // Do I need to create a sharedStore?
    if(!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

// If a programmer calls [[BNRitemStore alloc] init], let him
// know the error of his ways
- (instancetype)init {
    [NSException raise:@"Singleton" format:@"Use + [BNRItemStore sharedStore]"];
    
    return nil;
}

// Here is the real (secret) initializer
- (instancetype)initPrivate {
    self = [super init];
    
    if(self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *)allItems {
    return  [self.privateItems copy];
}

- (BNRItem *)createItem {
    BNRItem *item = [BNRItem randomItem];
    
    [self.privateItems addObject:item];
    
    return item;
}
@end

