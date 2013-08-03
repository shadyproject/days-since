//
//  DSAchievement.m
//  DaysSince
//
//  Created by Christopher Martin on 8/3/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "DSAchievement.h"

@implementation DSAchievement
#pragma mark Initializers
-(id)initWithAchievement:(NSString *)achieve startedOrStopped:(DSAchievementType)achiveType{
    self = [super init];
    if (self) {
        achievement = achieve;
        _longestStreak = 0;
        _currentStreak = 0;
        firstDate = [NSDate date];
        startedOrStopped = achiveType;
    }
    return self;
}

#pragma mark Overrides
-(NSString*)description{
    NSDateFormatter* formatter = [[NSDateFormatter alloc]init];
    [formatter setDateStyle:NSDateFormatterLongStyle];
    
    NSString* desc = [NSString stringWithFormat:@"On %@ I %@ %@",
                      [formatter stringFromDate:firstDate],
                      (startedOrStopped == DSAchievementTypeStarted ? @"started" : @"stopped"),
                      achievement];
    
    return desc;
}

#pragma mark Instance Methods
-(void)continueStreak{
    _currentStreak += 1;
    
    if (_longestStreak < _currentStreak) {
        _longestStreak = _currentStreak;
    }
}

-(void)endStreak{
    if (_longestStreak < _currentStreak) {
        _longestStreak = _currentStreak;
    }
    _currentStreak = 0;
    
}

#pragma mark Synthesized Properties
@synthesize startedOrStopped;
@synthesize achievement;
@synthesize firstDate;
@synthesize longestStreak=_longestStreak;
@synthesize currentStreak=_currentStreak;
@end
