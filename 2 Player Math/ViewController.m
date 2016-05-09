//
//  ViewController.m
//  2 Player Math
//
//  Created by Taylor Benna on 2016-05-09.
//  Copyright © 2016 Taylor Benna. All rights reserved.
//

#import "ViewController.h"
#import "Player.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerOneScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerTwoScoreLabel;

@property (weak, nonatomic) IBOutlet UITextField *inputText;
@property (weak, nonatomic) IBOutlet UILabel *correctLabel;

@property (nonatomic) Player *player1;
@property (nonatomic) Player *player2;
@property (nonatomic) int answer;
@property (nonatomic) NSMutableString *answerString;
@property (nonatomic) BOOL isPlayerOne;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.player1 = [[Player alloc] init];
    self.player2 = [[Player alloc] init];
    self.answerString = [[NSMutableString alloc] init];
    self.isPlayerOne = YES;
    [self makeRandomQuestion];
    [self printLives];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)enterButtonPressed:(UIButton *)sender {
    if (self.answer == [self.answerString integerValue]) {
        self.correctLabel.text = @"Correct";
        self.correctLabel.textColor = [UIColor colorWithRed:54/255.f green:214/255.f blue:59/255.f alpha:1.0];
    } else {
        self.correctLabel.text = @"Incorrect";
        self.correctLabel.textColor = [UIColor colorWithRed:240/255.f green:65/255.f blue:38/255.f alpha:1.0];
        if (self.isPlayerOne) {
            self.player1.lives -=1;
        } else {
            self.player2.lives -= 1;
        }
    }
    
    self.correctLabel.alpha = 1.0;
    [UIView animateWithDuration:1.0 delay:1.0 options:UIViewAnimationCurveEaseOut animations:^{
                         self.correctLabel.alpha = 0.0;}completion:^(BOOL finished){}];
    self.inputText.text = @"";
    self.answer = 0;
    self.answerString = [NSMutableString string];
    [self printLives];
    if(self.isPlayerOne) {
        self.isPlayerOne = NO;
    } else {
        self.isPlayerOne = YES;
    }
    
    if (self.player1.lives == 0 || self.player2.lives == 0) {
        NSString *str = [NSString new];
        if (self.isPlayerOne){
            str = @"Player 1 has Won!";
        } else {
            str = @"Player 2 has Won!";
        }
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:str message: @"Would you like to play again?"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* yesAction = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault
                                                             handler:^(UIAlertAction * action) {
                                                                 [self restartGame];
                                                             }];
        
        UIAlertAction* noAction = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault
                                                             handler:^(UIAlertAction * actionDelete) {
                                                                 exit(0);
                                                             }];
        
        [alert addAction:yesAction];
        [alert addAction:noAction];
        [self presentViewController:alert animated:YES completion:nil];
    } else {
        [self makeRandomQuestion];

    }
}

- (IBAction)oneButtonPressed:(UIButton *)sender {
    self.answerString = [[self.answerString stringByAppendingString:@"1"] mutableCopy];
    self.inputText.text = self.answerString;
}

- (IBAction)twoButtonPressed:(UIButton *)sender {
    self.answerString = [[self.answerString stringByAppendingString:@"2"] mutableCopy];
    self.inputText.text = self.answerString;
}

- (IBAction)threeButtonPressed:(UIButton *)sender {
    self.answerString = [[self.answerString stringByAppendingString:@"3"] mutableCopy];
    self.inputText.text = self.answerString;
}

- (IBAction)fourButtonPressed:(UIButton *)sender {
    self.answerString = [[self.answerString stringByAppendingString:@"4"] mutableCopy];
    self.inputText.text = self.answerString;
}

- (IBAction)fiveButtonPressed:(UIButton *)sender {
    self.answerString = [[self.answerString stringByAppendingString:@"5"] mutableCopy];
    self.inputText.text = self.answerString;
}

- (IBAction)sixButtonPressed:(UIButton *)sender {
    self.answerString = [[self.answerString stringByAppendingString:@"6"] mutableCopy];
    self.inputText.text = self.answerString;
}

- (IBAction)sevenButtonPressed:(UIButton *)sender {
    self.answerString = [[self.answerString stringByAppendingString:@"7"] mutableCopy];
    self.inputText.text = self.answerString;
}

- (IBAction)eightButtonPressed:(UIButton *)sender {
    self.answerString = [[self.answerString stringByAppendingString:@"8"] mutableCopy];
    self.inputText.text = self.answerString;
}

- (IBAction)nineButtonPressed:(UIButton *)sender {
    self.answerString = [[self.answerString stringByAppendingString:@"9"] mutableCopy];
    self.inputText.text = self.answerString;
}

- (IBAction)zeroButtonPressed:(UIButton *)sender {
    self.answerString = [[self.answerString stringByAppendingString:@"0"] mutableCopy];
    self.inputText.text = self.answerString;
}

- (void)makeRandomQuestion {
    int num1 = arc4random_uniform(19) + 1;
    int num2 = arc4random_uniform(19) + 1;
    self.answer = num1 + num2;
    if (self.isPlayerOne) {
        self.questionLabel.text = [NSString stringWithFormat:@"Player 1: %d + %d = ?", num1, num2];
    } else {
        self.questionLabel.text = [NSString stringWithFormat:@"Player 2: %d + %d = ?", num1, num2];

    }
    
}

-(void) printLives {
    NSMutableString *lives = [[NSMutableString alloc] init];
    lives = [@"Player 1 Lives: " mutableCopy];
    for (int i = 0; i < self.player1.lives; i++) {
        lives = [[lives stringByAppendingString:@"♥"] mutableCopy];
    }
    self.playerOneScoreLabel.text = lives;
    lives = [@"Player 2 Lives: " mutableCopy];
    for (int i = 0; i < self.player2.lives; i++) {
        lives = [[lives stringByAppendingString:@"♥"] mutableCopy];
    }
    self.playerTwoScoreLabel.text = lives;
}

-(void) restartGame {
    self.player1.lives = 3;
    self.player2.lives = 3;
    [self printLives];
    self.isPlayerOne = YES;
    [self makeRandomQuestion];
    
}

@end
