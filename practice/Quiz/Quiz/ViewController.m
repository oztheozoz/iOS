//
//  ViewController.m
//  Quiz
//
//  Created by Osbert Orr on 10/16/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic) int currentQuestionIndex;
@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;
@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.questions = @[@"From what is cognac made?",
                       @"What is 7+7?",
                       @"What is the capital of Vermont?"];
    
    self.answers = @[@"Grapes",
                     @"14",
                     @"Montpelier"];
}

- (IBAction)showQuestion:(id)sender {
    NSLog(@"called showQuestion");
    NSLog(@"%@", self.questions);
    self.currentQuestionIndex = ++self.currentQuestionIndex % [self.questions count];
    NSString *question = self.questions[self.currentQuestionIndex];
    self.questionLabel.text = question;
    self.answerLabel.text = @"???";
}

- (IBAction)showAnswer:(id)sender {
    NSLog(@"called showAnswer");
    NSLog(@"%@", self.answers);
    NSString *answer = self.answers[self.currentQuestionIndex];
    self.answerLabel.text = answer;
}

@end
