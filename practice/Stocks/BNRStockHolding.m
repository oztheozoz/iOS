//
//  BNRStockHolding.m
//  Stocks
//
//  Created by Osbert Orr on 10/8/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRStockHolding.h"

@implementation BNRStockHolding

- (float)costInDollars {
    return [self purchaseSharePrice] * [self numberOfShares];
}

- (float)valueInDollars {
    return [self currentSharePrice] * [self numberOfShares];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<Stock: %@ Purchace Price: %.2f Current Share Price: %.2f Number of Shares: %d, Value: %.2f>", self.symbol, self.purchaseSharePrice, self.currentSharePrice, self.numberOfShares, self.valueInDollars];
}
@end
