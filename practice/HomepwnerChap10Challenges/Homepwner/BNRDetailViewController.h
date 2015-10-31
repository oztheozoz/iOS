//
//  BNRDetailViewController.h
//  Homepwner
//
//  Created by Osbert Orr on 10/26/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BNRItem;

@interface BNRDetailViewController : UIViewController
@property (nonatomic, strong) BNRItem *item;
@end
