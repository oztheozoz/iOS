//
//  BNRImageStore.m
//  Homepwner
//
//  Created by Osbert Orr on 10/27/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRImageStore.h"


@interface BNRImageStore ()
@property (nonatomic, strong) NSMutableDictionary *dictionary;
@end

@implementation BNRImageStore
+ (instancetype)sharedStore {
    static BNRImageStore *sharedStore;
    
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

#pragma mark - Class life cycle
// NO one should call init
- (instancetype)init
{
    [NSException raise:@"Singleton" format:@"Use +[BNRImageStore sharedStore]"];
    
    return nil;
}

// Secret designated initializer
- (instancetype)initPrivate {
    self = [super init];
    
    if (self) {
        _dictionary = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

#pragma mark - Actions
- (void)setImage:(id)image forKey:(NSString *)key {
    self.dictionary[key] = image;
}

- (UIImage *)imageForKey:(NSString *)key {
    return self.dictionary[key];
}

- (void)deleteImageForKey:(NSString *)key {
    if (!key) {
        return;
    }
    
    [self.dictionary removeObjectForKey:key];
}
@end
