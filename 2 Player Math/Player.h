//
//  Player.h
//  2 Player Math
//
//  Created by Taylor Benna on 2016-05-09.
//  Copyright © 2016 Taylor Benna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic) int lives;
@property (nonatomic) int score;

-(void) playerLosesLife;

@end
