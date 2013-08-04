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
    //ensure that we delete any temp persistence files
    [TestableDSAchievementStorage removeTestPersistenceFile];
}

- (void)tearDown
{
    //clean up after ourselves
    for (DSAchievement* a in [[TestableDSAchievementStorage sharedStorage] allAchievements]){
        [[TestableDSAchievementStorage sharedStorage] removeAchievement:a];
    }
    
    //ensure that we delete any temp persistence files
    [TestableDSAchievementStorage removeTestPersistenceFile];
    [super tearDown];
}

-(void)testSingleton{
    STAssertEqualObjects( [TestableDSAchievementStorage sharedStorage],
                         [TestableDSAchievementStorage sharedStorage],
                         @"Singleton object should be the same");
}

-(void)testAddAchievement{
    
    NSUInteger testCount =[[[TestableDSAchievementStorage sharedStorage] allAchievements] count];
    STAssertTrue( testCount == 0, @"There shouldn't be anything in storage yet");
    
    DSAchievement* a = [[DSAchievement alloc] initWithAchievement:@"Test" startedOrStopped:DSAchievementTypeStarted];
    
    [[TestableDSAchievementStorage sharedStorage] addAchievement:a];
    
    testCount =[[[TestableDSAchievementStorage sharedStorage] allAchievements] count];
    
    STAssertTrue(testCount == 1, @"There should be 1 object in storage but there is %d", testCount);
}

-(void)testRemoveAchievment{
     DSAchievement* a = [[DSAchievement alloc] initWithAchievement:@"Test" startedOrStopped:DSAchievementTypeStarted];
    
    [[TestableDSAchievementStorage sharedStorage] addAchievement:a];
    
    NSUInteger testCount =[[[TestableDSAchievementStorage sharedStorage] allAchievements] count];
    
    STAssertTrue(testCount == 1, @"There should be 1 object in storage but has %d", testCount);
    
    [[TestableDSAchievementStorage sharedStorage] removeAchievement:a];
    
    testCount =[[[TestableDSAchievementStorage sharedStorage] allAchievements] count];
    
    STAssertTrue( testCount == 0, @"There shouldn't be anything left in storage but there is %d", testCount);
}

-(void)testPersistence{
     DSAchievement* a = [[DSAchievement alloc] initWithAchievement:@"Test" startedOrStopped:DSAchievementTypeStarted];
    [[TestableDSAchievementStorage sharedStorage] addAchievement:a];
    
    STAssertTrue([[TestableDSAchievementStorage sharedStorage] persist], @"Persistence should have worked");
}

@end
