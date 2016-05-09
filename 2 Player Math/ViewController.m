//
//  ViewController.m
//  2 Player Math
//
//  Created by Taylor Benna on 2016-05-09.
//  Copyright © 2016 Taylor Benna. All rights reserved.
//

#import "ViewController.h"
#import "GameController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *questionLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerOneScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *playerTwoScoreLabel;

@property (weak, nonatomic) IBOutlet UITextField *inputText;
@property (weak, nonatomic) IBOutlet UILabel *correctLabel;

//@property (nonatomic) Player *player1;
//@property (nonatomic) Player *player2;
//@property (nonatomic) Player *currentPlayer;
@property (nonatomic) int answer;
@property (nonatomic) NSMutableString *answerString;
@property (nonatomic) GameController *game;
//@property (nonatomic) BOOL isPlayerOne;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.game = [[GameController alloc] init];
    self.game.players = [[NSMutableArray alloc] init];
    [self.game.players addObject: [[Player alloc] initWithName:@"Player 1"]];
    [self.game.players addObject: [[Player alloc] initWithName:@"Player 2"]];
    self.game.currentPlayer = [[Player alloc] init];
    self.game.currentPlayer = self.game.players[0];
    self.answerString = [[NSMutableString alloc] init];
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
        self.game.currentPlayer.lives -=1;
    }
    
    self.correctLabel.alpha = 1.0;
    [UIView animateWithDuration:1.0 delay:1.0 options:UIViewAnimationCurveEaseOut animations:^{
                         self.correctLabel.alpha = 0.0;}completion:^(BOOL finished){}];
    self.inputText.text = @"";
    self.answer = 0;
    self.answerString = [NSMutableString string];
    [self printLives];
  
    
    if (self.game.currentPlayer.lives == 0) {
        NSString *str = [NSString new];
        [self.game changePlayer];
        str = [NSString stringWithFormat:@"%@ has Won!", self.game.currentPlayer.name];
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
        [self.game changePlayer];
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

- (IBAction)clearButtonPressed:(UIButton *)sender {
    self.answerString = [@"" mutableCopy];
    self.inputText.text = @"";
}

- (void)makeRandomQuestion {
    int num1 = arc4random_uniform(19) + 1;
    int num2 = arc4random_uniform(19) + 1;
    self.answer = num1 + num2;
    self.questionLabel.text = [NSString stringWithFormat:@"%@: %d + %d = ?",self.game.currentPlayer.name, num1, num2];
    
}

-(void) printLives {
    NSMutableString *lives = [[NSMutableString alloc] init];
    
    lives = [@"Player 1 Lives: " mutableCopy];
    Player *play = [[Player alloc] init];
    play = self.game.players[0];
    for (int i = 0; i < play.lives; i++) {
        lives = [[lives stringByAppendingString:@"♥"] mutableCopy];
    }
    self.playerOneScoreLabel.text = lives;
    
    play = self.game.players[1];
    lives = [@"Player 2 Lives: " mutableCopy];
    for (int i = 0; i < play.lives; i++) {
        lives = [[lives stringByAppendingString:@"♥"] mutableCopy];
    }
    self.playerTwoScoreLabel.text = lives;
}

-(void) restartGame {
    for (Player *play in self.game.players) {
        play.lives = 3;
    }
    [self printLives];
    self.game.currentPlayer = self.game.players[0];
    [self makeRandomQuestion];
    
}

@end
