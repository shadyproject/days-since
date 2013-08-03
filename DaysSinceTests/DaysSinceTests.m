//
//  DaysSinceTests.m
//  DaysSinceTests
//
//  Created by Christopher Martin on 8/2/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "DaysSinceTests.h"

@implementation DaysSinceTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

-(void)testLongestStreakUpdates{
    DSAchievement* achievement = [[DSAchievement alloc] initWithAchievement:@"Test Achievement" startedOrStopped:DSAchievementTypeStarted];
    
    [achievement continueStreak];
    
    STAssertTrue(achievement.currentStreak == achievement.longestStreak, @"Current streak and longest streak should be the same");
}

-(void)testLongestStreakDoestNotUpdate{
    DSAchievement* achievement = [[TestableDSAchievement alloc] initWithAchievement:@"Test Achievement" startedOrStopped:DSAchievementTypeStarted];
    
    [achievement continueStreak];
    
    STAssertFalse(achievement.currentStreak == achievement.longestStreak, @"Longest streak is not equal to current streak");
    STAssertTrue(achievement.longestStreak > achievement.currentStreak, @"Longest streak should be greater than current streak");
}

-(void)testLongestStreakUpdatesWhenItShould{
    DSAchievement* achievement = [[TestableDSAchievement alloc] initWithAchievement:@"Test Achievement" startedOrStopped:DSAchievementTypeStarted];
    
    for (int i = 0; i < 51; i +=1) {
        [achievement continueStreak];
    }
    
    STAssertTrue(achievement.currentStreak == achievement.longestStreak, @"Current streak and longest streak shold now be equal");
}

-(void)testStartedDescription{
    DSAchievement* achievement = [[DSAchievement alloc]initWithAchievement:@"Test Achievement" startedOrStopped:DSAchievementTypeStarted];
    
    NSRange foundStarted =[achievement.description rangeOfString:@"started"];
    
    STAssertTrue(foundStarted.length != 0, @"Description should contain the word started");
    STAssertTrue(foundStarted.location != 0, @"Description should contain the word started");
}

-(void)testStoppedDescription{
    DSAchievement* achievement = [[DSAchievement alloc]initWithAchievement:@"Test Acheivement" startedOrStopped:DSAchievementTypeStopped];
    
    NSRange foundStopped =[achievement.description rangeOfString:@"stopped"];
    
    STAssertTrue(foundStopped.location != 0,  @"Description should contain the word stopped.");
    STAssertTrue(foundStopped.length != 0,  @"Description should contain the word stopped.");
}
@end
