//
//  GameController.m
//  2 Player Math
//
//  Created by Taylor Benna on 2016-05-09.
//  Copyright © 2016 Taylor Benna. All rights reserved.
//

#import "GameController.h"

@implementation GameController

-(void)changePlayer {
    if ([self.currentPlayer isEqual:self.players[0]]) {
        self.currentPlayer = self.players[1];
    } else {
        self.currentPlayer = self.players[0];
    }
}

@end
