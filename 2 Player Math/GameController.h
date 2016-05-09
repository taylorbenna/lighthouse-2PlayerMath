//
//  GameController.h
//  2 Player Math
//
//  Created by Taylor Benna on 2016-05-09.
//  Copyright © 2016 Taylor Benna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface GameController : NSObject

@property (nonatomic) NSMutableArray *players;
@property (nonatomic) Player *currentPlayer;

-(void)changePlayer;

@end
