//
//  NSData+BNRSpeakableHex.m
//  SpeakableHex
//
//  Created by Osbert Orr on 10/15/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import "NSData+BNRSpeakableHex.h"

@implementation NSData (BNRSpeakableHex)

- (NSString *)encodeAsSpeakableString {
    NSArray *map = @[@"Camry",@"Nikon", @"Apple", @"Ford", @"Audi", @"Google",@"Nike", @"Amazon", @"Honda", @"Mazda", @"Buick",@"Fiat", @"Jeep", @"Lexus", @"Volvo", @"Fuji",@"Sony", @"Delta", @"Focus", @"Puma", @"Samsung",@"Tivo", @"Halo", @"Sting", @"Shrek", @"Avatar",@"Shell", @"Visa", @"Vogue", @"Twitter", @"Lego",@"Pepsi"];
    
    int64_t data;
    [self getBytes:&data length:sizeof(int64_t)];
    
    int64_t threeBitMask = 224;
    int64_t fiveBitMask = 31;
    char number, index;
    
    NSMutableArray *result = [NSMutableArray array];
    
    for(int i = 0; i < sizeof(int64_t); i++) {
        number = ((data & threeBitMask)>>5) + 2;
        index = data & fiveBitMask;
        [result insertObject:map[index] atIndex:0];
        [result insertObject:[NSNumber numberWithChar:number] atIndex:0];
         
        data >>= 8;
    }
    return [[result copy] componentsJoinedByString:@" "];
}

+ (NSData *)dataWithSpeakableString:(NSString *)s error:(NSError *__autoreleasing *)e {
    NSArray *data = [s componentsSeparatedByString:@" "];
    NSDictionary *map = @{@"Camry" : @0, @"Nikon" : @1, @"Apple" : @2, @"Ford" : @3, @"Audi" : @4, @"Google" : @5, @"Nike" : @6, @"Amazon" : @7, @"Honda" : @8, @"Mazda" : @9, @"Buick" : @10, @"Fiat" : @11, @"Jeep" : @12, @"Lexus" : @13, @"Volvo" : @14, @"Fuji" : @15, @"Sony": @16, @"Delta" : @17, @"Focus" : @18, @"Puma" : @19, @"Samsung" : @20, @"Tivo" : @21, @"Halo" : @22, @"Sting" : @23, @"Shrek" : @24, @"Avatar" : @25, @"Shell" : @26, @"Visa" : @27, @"Vogue" : @28, @"Twitter" : @29, @"Lego" : @30, @"Pepsi" : @31};
    
    int64_t result = 0;
    NSString *tempString;
    int tempInt;
    NSNumber *tempNumber;
    
    for(int i = 0; i < [data count]; i++) {
        tempString = data[i];
        if(i % 2 == 0){
            tempInt = [tempString intValue] - 2;
            result <<= 3;
            result |= tempInt;
        } else {
            tempNumber = [map objectForKey:tempString];
            if(tempNumber) {
                tempInt = [tempNumber intValue];
                result <<= 5;
                result |= tempInt;
            } else {
                NSDictionary *userInfo = @{NSLocalizedDescriptionKey : @"Unable to parse"};
                *e = [NSError errorWithDomain:@"SpeakableByted" code:1 userInfo:userInfo];
                
                return nil;
            }
            
        }
    }
    return [NSData dataWithBytes:&result length:sizeof(int64_t)];
}
@end
