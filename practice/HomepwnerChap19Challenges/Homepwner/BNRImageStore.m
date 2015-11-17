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
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedStore = [[self alloc] initPrivate];
    });
    
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
        
        NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
        [nc addObserver:self selector:@selector(clearCache:) name:UIApplicationDidReceiveMemoryWarningNotification object:nil];
    }
    
    return self;
}

#pragma mark - Actions
- (void)setImage:(id)image forKey:(NSString *)key {
    self.dictionary[key] = image;
    
    // Create full path for image
    NSString *imagePath = [self imagePathForKey:key];
    
    // Turn image into JPEG data
    //NSData *data = UIImageJPEGRepresentation(image, 0.5);
    NSData *data = UIImagePNGRepresentation(image);
    
    // Write it to full path
    [data writeToFile:imagePath atomically:YES];
}

- (UIImage *)imageForKey:(NSString *)key {
    // If possible, get it from the dictionary
    UIImage *result = self.dictionary[key];
    
    if (!result) {
        NSString *imagePath = [self imagePathForKey:key];
        
        // Create UIImage object from file
        result = [UIImage imageWithContentsOfFile:imagePath];
        
        // If we found an image on the file system, place it into the cache
        if (result) {
            self.dictionary[key] = result;
        } else {
            NSLog(@"Error: unable to find %@", imagePath);
        }
    }
    
    return result;
}

- (void)deleteImageForKey:(NSString *)key {
    if (!key) {
        return;
    }
    
    [self.dictionary removeObjectForKey:key];
    
    NSString *imagePath = [self imagePathForKey:key];
    [[NSFileManager defaultManager] removeItemAtPath:imagePath error:nil];
}

- (NSString *)imagePathForKey:(NSString *)key {
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentDirectory = [documentDirectories firstObject];
    
    return [documentDirectory stringByAppendingPathComponent:key];
}

- (void)clearCache:(NSNotification *)note {
    NSLog(@"flushing %ld images out of the cache", [self.dictionary count]);
    [self.dictionary removeAllObjects];
}
@end
