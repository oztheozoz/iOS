//
//  BNRDrawViewController.m
//  TouchTracker
//
//  Created by Osbert Orr on 10/28/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRDrawViewController.h"
#import "BNRDrawView.h"

@implementation BNRDrawViewController
- (void)loadView {
    self.view = [[BNRDrawView alloc] initWithFrame:CGRectZero];
}
@end
