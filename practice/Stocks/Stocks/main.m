//
//  main.m
//  Stocks
//
//  Created by Osbert Orr on 10/8/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRForeignStockHolding.h"
#import "BNRPortfolio.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BNRStockHolding *hold1 = [[BNRStockHolding alloc] init];
        BNRStockHolding *hold2 = [[BNRStockHolding alloc] init];
        BNRStockHolding *hold3 = [[BNRStockHolding alloc] init];
        
        [hold1 setPurchaseSharePrice:2.30];
        [hold1 setCurrentSharePrice:4.50];
        [hold1 setNumberOfShares:40];
        [hold1 setSymbol:@"MSFT"];
        
        [hold2 setPurchaseSharePrice:12.19];
        [hold2 setCurrentSharePrice:10.56];
        [hold2 setNumberOfShares:90];
        [hold2 setSymbol:@"INTL"];
        
        [hold3 setPurchaseSharePrice:45.10];
        [hold3 setCurrentSharePrice:49.51];
        [hold3 setNumberOfShares:210];
        [hold3 setSymbol:@"AAPL"];
        
        BNRForeignStockHolding *hold4 = [[BNRForeignStockHolding alloc] init];
        BNRForeignStockHolding *hold5 = [[BNRForeignStockHolding alloc] init];
        BNRForeignStockHolding *hold6 = [[BNRForeignStockHolding alloc] init];
        
        [hold4 setConversionRate:2];
        [hold4 setPurchaseSharePrice:2.30];
        [hold4 setCurrentSharePrice:4.50];
        [hold4 setNumberOfShares:40];
        [hold4 setSymbol:@"VZ"];
        
        [hold5 setConversionRate:2];
        [hold5 setPurchaseSharePrice:12.19];
        [hold5 setCurrentSharePrice:10.56];
        [hold5 setNumberOfShares:90];
        [hold5 setSymbol:@"CMCSA"];
        
        [hold6 setConversionRate:2];
        [hold6 setPurchaseSharePrice:45.10];
        [hold6 setCurrentSharePrice:49.51];
        [hold6 setNumberOfShares:210];
        [hold6 setSymbol:@"TSLA"];
        
        NSMutableArray *stockHoldings = [[NSMutableArray alloc] init];
        [stockHoldings addObject:hold1];
        [stockHoldings addObject:hold2];
        [stockHoldings addObject:hold3];
        [stockHoldings addObject:hold4];
        [stockHoldings addObject:hold5];
        [stockHoldings addObject:hold6];
        
        for(BNRStockHolding *stock in stockHoldings) {
            NSLog(@"Purchase Share Price = %.2f", [stock purchaseSharePrice]);
            NSLog(@"Current Share Price = %.2f", [stock currentSharePrice]);
            NSLog(@"Number of Share = %d", [stock numberOfShares]);
            NSLog(@"Cost in dollars = %.2f", [stock costInDollars]);
            NSLog(@"Value in dollars = %.2f", [stock valueInDollars]);
            NSLog(@"---------------------");
        }
        
        BNRPortfolio *portfolio = [[BNRPortfolio alloc] init];
        [portfolio addStock:hold1];
        [portfolio addStock:hold2];
        [portfolio addStock:hold3];
        [portfolio addStock:hold4];
        [portfolio addStock:hold5];
        [portfolio addStock:hold6];
        NSLog(@"Top 3: %@", [portfolio top3]);
        NSLog(@"Alpha sorted stock symbols: %@", [portfolio getAlphaSorted]);
        [portfolio removeStockAtIndex:5];
        [portfolio removeStockAtIndex:4];
        
        NSLog(@"%@", portfolio);
        
    }
    return 0;
}
