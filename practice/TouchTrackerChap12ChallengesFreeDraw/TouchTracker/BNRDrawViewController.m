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
    
    
    CGRect btnFrame = CGRectMake(5, 30, 50, 30);
    CGRect lblFrame = CGRectMake(5, 5, 50, 20);
    
    UIButton *clearBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UILabel *label = [[UILabel alloc] initWithFrame:lblFrame];
    
    label.text = @"Clear";
    clearBtn.frame = btnFrame;
    clearBtn.backgroundColor = [UIColor whiteColor];
    [clearBtn addSubview:label];
    [clearBtn addTarget:self action:@selector(clearView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clearBtn];
}

- (void)clearView {
    BNRDrawView *view = (BNRDrawView *)self.view;
    [view clearScreen];
}

@end
