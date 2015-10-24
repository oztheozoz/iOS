//
//  main.m
//  SpeakableHex
//
//  Created by Osbert Orr on 10/15/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSData+BNRSpeakableHex.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
        int64_t randomBytes = 6047261655457097320;
        
        NSData *inData = [NSData dataWithBytes:&randomBytes length:sizeof(int64_t)];
        NSLog(@"int64_t in hex %llx", randomBytes);
        NSLog(@"inData %@", inData);
        NSString *tempString = [inData encodeAsSpeakableString];
        NSError *tmpError;
        NSLog(@"%@", tempString);
        NSData *outData = [NSData dataWithSpeakableString:tempString error:&tmpError];
        int64_t returnedRandomBytes;
        [outData getBytes:&returnedRandomBytes length:sizeof(int64_t)];
        NSLog(@"int64_t in hex %llx", returnedRandomBytes);
        NSLog(@"outData %@", outData);
         */
        
        srandom((unsigned int)time(NULL));
        int64_t randomBytes = (random() << 32) | random();
        
        NSData *inData = [NSData dataWithBytes:&randomBytes length:sizeof(int64_t)];
        
        NSLog(@"In data = %@", inData);
        
        NSString *speakable = [inData encodeAsSpeakableString];
        NSLog(@"Got string \"%@\"", speakable);
        
        NSError *err;
        NSData *outData = [NSData dataWithSpeakableString:speakable error:&err];
        
        if(!outData) {
            NSLog(@"Unexpected error: %@", [err localizedDescription]);
            return -1;
        }
        NSLog(@"Out data: %@", outData);
        
        if(![outData isEqual:inData]) {
            NSLog(@"Data coming out not the same as what went in");
            return -1;
        }
        
        speakable = @"2 Jeep 3 Halo 7 Teevo 2 Pepsi 2 Volvo";
        outData = [NSData dataWithSpeakableString:speakable error:&err];
        
        if(!outData) {
            NSLog(@"Expected error: %@", [err localizedDescription]);
        } else {
            NSLog(@"Missed bad string");
            return -1;
        }
    }
    return 0;
}
