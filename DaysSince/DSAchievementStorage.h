//
//  DSAchievementStorage.h
//  DaysSince
//
//  Created by Christopher Martin on 8/3/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DSAchievement;

@interface DSAchievementStorage : NSObject
{
    NSMutableArray* achievements;
}

+(DSAchievementStorage*)sharedStorage;

-(NSString*)persistencePath;
-(BOOL)persist;
-(NSArray*)allAchievements;
-(void)addAchievement:(DSAchievement*)achieve;
-(void)removeAchievement:(DSAchievement*)achieve;

@end
