//
//  BNRPortfolio.m
//  Stocks
//
//  Created by Osbert Orr on 10/9/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRPortfolio.h"

@interface BNRPortfolio()
{
    NSMutableArray *_stocks;
}
@end

@implementation BNRPortfolio

- (NSArray *)stocks {
    return [_stocks copy];
}

- (void)setStocks:(NSArray *)stocks {
    _stocks = [stocks mutableCopy];
}

- (void)addStock:(BNRStockHolding *)stock {
    if(!_stocks) {
        _stocks = [[NSMutableArray alloc] init];
    }
    
    [_stocks addObject:stock];
}

- (void)removeStock:(BNRStockHolding *)stock {
    if(_stocks) {
        [_stocks removeObject:stock];
    }
}

- (void)removeStockAtIndex:(NSUInteger)i {
    if(_stocks) {
        [_stocks removeObjectAtIndex:i];
    }
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Stocks in portfolio: %@\n", _stocks];
}

- (NSArray *)top3 {
    NSRange range;
    range.location = 0;
    range.length = 3;
    NSMutableArray *stocksCopy = [_stocks mutableCopy];
    NSSortDescriptor *desc = [NSSortDescriptor sortDescriptorWithKey:@"valueInDollars" ascending:NO];
    [stocksCopy sortUsingDescriptors:@[desc]];
    return [[stocksCopy copy] subarrayWithRange:range];
}

- (NSArray *)getAlphaSorted {
    NSMutableArray *stocksCopy = [_stocks mutableCopy];
    NSSortDescriptor *desc = [NSSortDescriptor sortDescriptorWithKey:@"symbol" ascending:YES];
    [stocksCopy sortUsingDescriptors:@[desc]];
    return [stocksCopy copy];
}
@end
