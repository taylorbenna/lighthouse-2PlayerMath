//
//  Player.m
//  2 Player Math
//
//  Created by Taylor Benna on 2016-05-09.
//  Copyright © 2016 Taylor Benna. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)initWithName:(NSString*)name
{
    self = [super init];
    if (self) {
        self.lives = 3;
        self.name = [[NSString alloc] initWithString:name];
    }
    return self;
}

@end
