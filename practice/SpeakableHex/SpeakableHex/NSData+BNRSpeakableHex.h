//
//  NSData+BNRSpeakableHex.h
//  SpeakableHex
//
//  Created by Osbert Orr on 10/15/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSData (BNRSpeakableHex)
- (NSString *)encodeAsSpeakableString;
+ (NSData *)dataWithSpeakableString:(NSString *)s error:(NSError **)e;
@end
