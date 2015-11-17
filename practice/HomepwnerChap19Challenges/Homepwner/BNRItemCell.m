//
//  BNRItemCell.m
//  Homepwner
//
//  Created by Osbert Orr on 11/12/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRItemCell.h"

@implementation BNRItemCell
- (IBAction)showImage:(id)sender {
    if (self.actionBlock) {
        self.actionBlock();
    }
}
@end
