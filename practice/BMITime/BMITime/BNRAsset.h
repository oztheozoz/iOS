//
//  BNRAsset.h
//  BMITime
//
//  Created by Osbert Orr on 10/8/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BNREmployee;

@interface BNRAsset : NSObject
@property (nonatomic, copy) NSString *label;
@property (nonatomic) unsigned int resaleValue;
@property (nonatomic, weak) BNREmployee *holder;
@end
