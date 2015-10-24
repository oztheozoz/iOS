//
//  BNRReminderViewController.m
//  HypnoNerd
//
//  Created by Osbert Orr on 10/21/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRReminderViewController.h"

@interface BNRReminderViewController ()
@property (nonatomic, weak) IBOutlet UIDatePicker *datePicker;
@end

@implementation BNRReminderViewController
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self) {
        // Set the tab bar item's title
        self.tabBarItem.title = @"Reminder";
        
        // Create a UIImage from a file
        UIImage *image = [UIImage imageNamed:@"Time.png"];
        
        // Put that image on the tab bar item
        self.tabBarItem.image = image;
    }
    
    return self;
}

- (void)viewDidLoad {
    // Always call the super implementation of viewDidLoad
    [super viewDidLoad];
    NSLog(@"BNRReminderViewController loaded its view.");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"BNRReminderViewController is about to get its view added to the window.");
    
    self.datePicker.minimumDate = [NSDate dateWithTimeIntervalSinceNow:60];
}

- (IBAction)addReminder:(id)sender {
    NSDate *date = self.datePicker.date;
    NSLog(@"Setting a reminder for %@", date);
    
    UILocalNotification *note = [[UILocalNotification alloc] init];
    note.alertBody = @"Hypnotize me!";
    note.fireDate = date;
    
    UIApplication *application = [UIApplication sharedApplication];
    
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert categories:nil];
    [application registerUserNotificationSettings:settings];
    [application scheduleLocalNotification:note];
}
@end
