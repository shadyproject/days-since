//
//  TestableDSAchievement.m
//  DaysSince
//
//  Created by Christopher Martin on 8/3/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "TestableDSAchievement.h"

@implementation TestableDSAchievement

- (id)initWithAchievement:(NSString *)achieve startedOrStopped:(DSAchievementType)achiveType
{
    self = [super initWithAchievement:achieve startedOrStopped:achiveType];
    if (self) {
        _longestStreak = 50;
    }
    return self;
}

@end
