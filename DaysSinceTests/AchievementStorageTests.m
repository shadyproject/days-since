//
//  PersistenceTests.m
//  DaysSince
//
//  Created by Christopher Martin on 8/4/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "AchievementStorageTests.h"
#import "TestableDSAchievementStorage.h"
#import "TestableDSAchievement.h"

@implementation AchievementStorageTests
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

-(void)testSingleton{
    STAssertEqualObjects( [TestableDSAchievementStorage sharedStorage],
                         [TestableDSAchievementStorage sharedStorage],
                         @"Singleton object should be the same");
}

-(void)testAddAchievement{
    STAssertTrue([[[TestableDSAchievementStorage sharedStorage] allAchievements] count] == 0, @"There shouldn't be anythign in storage yet");
    
    DSAchievement* a = [[DSAchievement alloc] initWithAchievement:@"Test" startedOrStopped:DSAchievementTypeStarted];
    
    [[TestableDSAchievementStorage sharedStorage] addAchievement:a];
    
    STAssertTrue([[[TestableDSAchievementStorage sharedStorage] allAchievements] count] == 1, @"There should be 1 object in storage");
}

-(void)testRemoveAchievment{
     DSAchievement* a = [[DSAchievement alloc] initWithAchievement:@"Test" startedOrStopped:DSAchievementTypeStarted];
    
    [[TestableDSAchievementStorage sharedStorage] addAchievement:a];
    
    STAssertTrue([[[TestableDSAchievementStorage sharedStorage] allAchievements] count] == 1, @"There should be 1 object in storage");
    
    [[TestableDSAchievementStorage sharedStorage] removeAchievement:a];
    
    STAssertTrue([[[TestableDSAchievementStorage sharedStorage] allAchievements] count] == 0, @"There shouldn't be anything left in storage");
}

-(void)testPersistAchievement{
    STFail(@"Not Yet Implemented");
}

-(void)testRestoreAchievement{
    STFail(@"Not yet implemented");
}
@end
