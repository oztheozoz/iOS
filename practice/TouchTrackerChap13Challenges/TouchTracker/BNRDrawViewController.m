//
//  BNRDrawViewController.m
//  TouchTracker
//
//  Created by Osbert Orr on 10/28/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRDrawViewController.h"
#import "BNRDrawView.h"
@interface BNRDrawViewController ()
@property (strong, nonatomic) IBOutlet UIView *colorPickerView;
@end

@implementation BNRDrawViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        UISwipeGestureRecognizer *swipeUpRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeUp:)];
        swipeUpRecognizer.direction = UISwipeGestureRecognizerDirectionUp;
        swipeUpRecognizer.numberOfTouchesRequired = 3;
        swipeUpRecognizer.delaysTouchesBegan = YES;
        [self.view addGestureRecognizer:swipeUpRecognizer];
        
        UISwipeGestureRecognizer *swipeDownRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeDown:)];
        swipeDownRecognizer.direction = UISwipeGestureRecognizerDirectionDown;
        swipeDownRecognizer.numberOfTouchesRequired = 3;
        swipeDownRecognizer.delaysTouchesBegan = YES;
        [self.view addGestureRecognizer:swipeDownRecognizer];
    }
    return self;
}
- (void)loadView {
    self.view = [[BNRDrawView alloc] initWithFrame:CGRectZero];
}

#pragma mark - Setters and getters

- (UIView *)colorPickerView {
    if (!_colorPickerView) {
        [[NSBundle mainBundle] loadNibNamed:@"ColorPickerView" owner:self options:nil];
    }
    
    return _colorPickerView;
}

- (void)swipeUp:(UISwipeGestureRecognizer *)gr {
    NSLog(@"Swipe up detected");
    [self showPanel];
}

- (void)swipeDown:(UISwipeGestureRecognizer *)gr {
    NSLog(@"Swipe down detected");
    [self hidePanel];
}

- (void)hidePanel {
    UIView *colorPicker = self.colorPickerView;
    CGRect colorPickerFrame = colorPicker.frame;
    CGRect selfFrame = self.view.frame;
    
    colorPickerFrame.origin.x = 0;
    colorPickerFrame.origin.y = selfFrame.size.height;
    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        colorPicker.frame = colorPickerFrame;
    } completion:nil];
    
    if (![self.view.subviews containsObject:colorPicker]) {
        colorPicker.frame = colorPickerFrame;
    }
}

- (void)showPanel {
    UIView *colorPicker = self.colorPickerView;
    
    if (![self.view.subviews containsObject:colorPicker]) {
        [self hidePanel];
        [self.view addSubview:colorPicker];
    }

    CGRect colorPickerFrame = colorPicker.frame;
    CGRect selfFrame = self.view.frame;
    
    float starty = selfFrame.size.height - colorPickerFrame.size.height;
    colorPickerFrame.origin.y = starty;
    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        colorPicker.frame = colorPickerFrame;
    } completion:nil];
    
    
}


- (IBAction)changeColor:(id)sender {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    UIButton *btn = (UIButton *)sender;
    BNRDrawView *view = (BNRDrawView *)self.view;
    view.color = btn.backgroundColor;
}

@end
