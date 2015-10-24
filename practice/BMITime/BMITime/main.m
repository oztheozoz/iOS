//
//  main.m
//  BMITime
//
//  Created by Osbert Orr on 10/8/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNREmployee.h"
#import "BNRAsset.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
        BNREmployee *mikey = [[BNREmployee alloc] init];
        NSLog(@"mikey sent description message %@", mikey);
        
        [mikey setWeightInKilos:96];
        [mikey setHeightInMeters:1.8];
        
        float height = [mikey heightInMeters];
        int weight = [mikey weightInKilos];
        NSLog(@"mikey is %.2f meters tall and weighs %d kilograms", height, weight);
        
        float bmi = [mikey bodyMassIndex];
        NSLog(@"mikey has a BMI of %f", bmi);
        */
        
        NSMutableArray *employees = [[NSMutableArray alloc] init];
        NSMutableDictionary *executives = [[NSMutableDictionary alloc] init];
        
        for(int i = 0; i < 10; i++) {
            BNREmployee *mikey = [[BNREmployee alloc] init];
            
            mikey.weightInKilos = 90 + i;
            mikey.heightInMeters = 1.8 - i/10.0;
            mikey.employeeID = i;
            
            [employees addObject:mikey];
            
            if(i == 0) {
                [executives setObject:mikey forKey:@"CEO"];
            }
            
            if(i == 1) {
                [executives setObject:mikey forKey:@"CTO"];
            }
        }
        
        NSMutableArray *allAssets = [[NSMutableArray alloc] init];
        
        for(int i = 0; i < 10; i++) {
            BNRAsset *asset = [[BNRAsset alloc] init];
            
            NSString *currentLabel = [NSString stringWithFormat:@"Laptop %d", i];
            asset.label = currentLabel;
            asset.resaleValue = 350 + i * 17;
            
            NSUInteger randomIndex = random() % [employees count];
            
            BNREmployee *randomEmployee = [employees objectAtIndex:randomIndex];
            [randomEmployee addAsset:asset];
            
            [allAssets addObject:asset];
        }
        
        NSLog(@"Employees: %@", employees);
        NSLog(@"Giving up ownership of one employee");
        [employees removeObjectAtIndex:5];
        NSLog(@"allAssets: %@", allAssets);
        NSLog(@"executives: %@", executives);
        NSLog(@"CEO: %@", executives[@"CEO"]);
        executives = nil;
        NSLog(@"Giving up ownership of arrays");
        allAssets = nil;
        employees = nil;
    }
    return 0;
}
