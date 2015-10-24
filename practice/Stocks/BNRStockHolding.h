//
//  BNRStockHolding.h
//  Stocks
//
//  Created by Osbert Orr on 10/8/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRStockHolding : NSObject

@property (nonatomic) float purchaseSharePrice, currentSharePrice;
@property (nonatomic) int numberOfShares;
@property (nonatomic) NSString *symbol;

- (float)costInDollars;
- (float)valueInDollars;
@end
