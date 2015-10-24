//
//  ViewController.h
//  iTahDoodle
//
//  Created by Osbert Orr on 10/12/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <UIKit/UIKit.h>
NSString *BNRDocPath(void);

@interface ViewController : UIViewController <UITableViewDataSource>
@property (nonatomic) UITableView *taskTable;
@property (nonatomic) UITextField *taskField;
@property (nonatomic) UIButton *insertButton;
@property (nonatomic) NSMutableArray *tasks;
- (void)addTask:(id)sender;
@end
