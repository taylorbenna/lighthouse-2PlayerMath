//
//  Player.m
//  2 Player Math
//
//  Created by Taylor Benna on 2016-05-09.
//  Copyright © 2016 Taylor Benna. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.score = 0;
        self.lives = 3;
    }
    return self;
}

-(void) playerLosesLife {
    self.lives--;
}

@end
