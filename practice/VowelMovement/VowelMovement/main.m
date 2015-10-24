//
//  main.m
//  VowelMovement
//
//  Created by Osbert Orr on 10/12/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^ArrayEnumerationBlock)(id, NSUInteger, BOOL *);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *originalStrings = @[@"Sauerkraut", @"Raygun", @"Big Nerd Ranch", @"Mississippi"];
        NSLog(@"original strings: %@", originalStrings);
        
        NSMutableArray *devowelizedStrings = [NSMutableArray array];
        
        NSArray *vowels = @[@"a", @"e", @"i", @"o", @"u"];
        
        //ArrayEnumerationBlock devowelizer;
        /*
        devowelizer = ^(id string, NSUInteger i, BOOL *stop) {
            NSRange yRange = [string rangeOfString:@"y" options: NSCaseInsensitiveSearch];
            
            if(yRange.location != NSNotFound) {
                *stop = YES;
                return;
            }
            
            NSMutableString *newString = [NSMutableString stringWithFormat:string];
            for(NSString *s in vowels) {
                NSRange fullRange = NSMakeRange(0, [newString length]);
                [newString replaceOccurrencesOfString:s withString:@"" options:NSCaseInsensitiveSearch range:fullRange];
            }
            
            [devowelizedStrings addObject: newString];
        };*/
        
        [originalStrings enumerateObjectsUsingBlock:^(id string, NSUInteger i, BOOL *stop) {
            NSRange yRange = [string rangeOfString:@"y" options: NSCaseInsensitiveSearch];
            
            if(yRange.location != NSNotFound) {
                *stop = YES;
                return;
            }
            
            NSMutableString *newString = [NSMutableString stringWithFormat:string];
            for(NSString *s in vowels) {
                NSRange fullRange = NSMakeRange(0, [newString length]);
                [newString replaceOccurrencesOfString:s withString:@"" options:NSCaseInsensitiveSearch range:fullRange];
            }
            
            [devowelizedStrings addObject: newString];
        }];
        NSLog(@"devowelized strings: %@", devowelizedStrings);
    }
    return 0;
}
