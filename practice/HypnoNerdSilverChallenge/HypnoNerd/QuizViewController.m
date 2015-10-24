//
//  QuizViewController.m
//  Quiz2
//
//  Created by Osbert Orr on 10/22/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()
@property (nonatomic) int currentQuestionIndex;
@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;
@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

@end

@implementation QuizViewController
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self) {
        self.tabBarItem.title = @"Quiz";
    }
    
    return self;
}

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

@end
