//
//  BNRForeignStockHolding.m
//  Stocks
//
//  Created by Osbert Orr on 10/8/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRForeignStockHolding.h"

@implementation BNRForeignStockHolding
- (float)costInDollars {
    return [self purchaseSharePrice] * [self conversionRate] * [self numberOfShares];
}

- (float)valueInDollars {
    return [self currentSharePrice] * [self conversionRate] * [self numberOfShares];
}
@end
