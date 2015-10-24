//
//  BNREmployee.h
//  BMITime
//
//  Created by Osbert Orr on 10/8/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRPerson.h"
@class BNRAsset;

@interface BNREmployee : BNRPerson
@property (nonatomic, copy) NSSet *assets;
@property (nonatomic) unsigned int employeeID;
@property (nonatomic) unsigned int officeAlarmCode;
@property (nonatomic) NSDate *hireDate;
- (double)yearsOfEmployment;
- (NSString *)description;
- (void)addAsset:(BNRAsset *)a;
- (unsigned int)valueOfAssets;
@end
