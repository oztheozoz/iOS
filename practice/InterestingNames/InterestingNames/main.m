//
//  main.m
//  InterestingNames
//
//  Created by Osbert Orr on 10/8/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *nameString = [NSString stringWithContentsOfFile:@"/usr/share/dict/propernames"
                                                         encoding:NSUTF8StringEncoding
                                                            error:NULL];
        NSString *wordsString = [NSString stringWithContentsOfFile:@"/usr/share/dict/words"
                                                          encoding:NSUTF8StringEncoding
                                                             error:NULL];
        NSArray *names = [nameString componentsSeparatedByString:@"\n"];
        NSArray *words = [wordsString componentsSeparatedByString:@"\n"];
        
        NSString *lowerName;
        
        for (NSString *n in names) {
            lowerName = [n lowercaseString];
            for(NSString *w in words) {
                if([lowerName isEqualToString:w]) {
                    NSLog(@"Word: %@ Name: %@", w, n);
                }
            }
        }
    }
    return 0;
}
