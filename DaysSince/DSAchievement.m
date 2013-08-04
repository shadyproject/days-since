//
//  DSAchievement.m
//  DaysSince
//
//  Created by Christopher Martin on 8/3/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "DSAchievement.h"

@implementation DSAchievement
#pragma mark -
#pragma mark Initializers
-(id)initWithCoder:(NSCoder*)aDecoder{
    self = [super init];
    
    if (self){
        achievement =[aDecoder decodeObjectForKey:@"achievement"];
        startedOrStopped = (DSAchievementType)[aDecoder decodeIntForKey:@"startedOrStopped"];
        firstDate = [aDecoder decodeObjectForKey:@"firstDate"];
        _longestStreak = [aDecoder decodeIntForKey:@"longestStreak"];
        _currentStreak = [aDecoder decodeIntForKey:@"currentStreak"];
    }
    
    return self;
}

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

#pragma mark -
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

#pragma mark -
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

#pragma mark -
#pragma mark Synthesized Properties
@synthesize startedOrStopped;
@synthesize achievement;
@synthesize firstDate;
@synthesize longestStreak=_longestStreak;
@synthesize currentStreak=_currentStreak;

#pragma mark -
#pragma mark NSCoder methods
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeInt:startedOrStopped forKey:@"startedOrStopped"];
    [aCoder encodeObject:achievement forKey:@"achievement"];
    [aCoder encodeObject:firstDate forKey:@"firstDate"];
    [aCoder encodeInt:_longestStreak forKey:@"longestStreak"];
    [aCoder encodeInt:_currentStreak forKey:@"currentStreak"];
}


@end
