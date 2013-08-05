//
//  DSAchievement.h
//  DaysSince
//
//  Created by Christopher Martin on 8/3/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, DSAchievementType){
    DSAchievementTypeStarted,
    DSAchievementTypeStopped 
};

NSString* const DSAchievementUserInfoKey = @"achievement";

@interface DSAchievement : NSObject <NSCoding>
{
    NSInteger _longestStreak;
    //should current streak be calculated via date?
    NSInteger _currentStreak;
}

#pragma mark Initializers
-(id)initWithAchievement:(NSString*)achieve startedOrStopped:(DSAchievementType)achiveType;

#pragma mark Instance Methods
-(void)continueStreak;
-(void)endStreak;

#pragma mark Properties
@property (nonatomic, copy) NSString* achievement;
@property (nonatomic) DSAchievementType startedOrStopped;
@property (nonatomic, readonly) NSDate* firstDate;
@property (nonatomic, readonly) NSInteger longestStreak;
@property (nonatomic, readonly) NSInteger currentStreak;
@end
