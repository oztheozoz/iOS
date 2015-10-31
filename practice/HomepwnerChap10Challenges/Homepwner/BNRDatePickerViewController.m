//
//  BNRDatePickerViewController.m
//  Homepwner
//
//  Created by Osbert Orr on 10/26/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRDatePickerViewController.h"
#import "BNRItem.h"

@interface BNRDatePickerViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation BNRDatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)viewWillAppear:(BOOL)animated {
    self.datePicker.date = self.item.dateCreated;
}

- (void)viewWillDisappear:(BOOL)animated {
    self.item.dateCreated = self.datePicker.date;
}
@end
