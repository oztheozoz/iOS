//
//  BNRPortfolio.h
//  Stocks
//
//  Created by Osbert Orr on 10/9/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BNRStockHolding;

@interface BNRPortfolio : NSObject
@property (nonatomic) NSArray *stocks;
- (void)addStock:(BNRStockHolding *)stock;
- (void)removeStock:(BNRStockHolding *)stock;
- (void)removeStockAtIndex:(NSUInteger)i;
- (NSArray *)top3;
- (NSArray *)getAlphaSorted;
@end
