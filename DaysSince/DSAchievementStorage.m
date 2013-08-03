//
//  DSAchievementStorage.m
//  DaysSince
//
//  Created by Christopher Martin on 8/3/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "DSAchievementStorage.h"
#import "DSAchievement.h"

@implementation DSAchievementStorage

//thread safe singleton method from
//http://cocoasamurai.blogspot.com/2011/04/singletons-your-doing-them-wrong.html
+(DSAchievementStorage*)sharedStorage{
    static id sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[super allocWithZone:nil] init];
    });
    
    return sharedInstance;
}

-(NSArray *)allAchievements{
    return achievements;
}

-(void)addAcheviement:(DSAchievement *)achieve{
    [achievements addObject:achieve];
}

-(void)removeItem:(DSAchievement*)achieve{
    [achievements removeObjectIdenticalTo:achieve];
}

-(void)moveItemAtIndex:(int)from toIndex:(int)to {
    DSAchievement* achieve = [achievements objectAtIndex:from];
    
    [achievements removeObjectAtIndex:from];
    [achievements insertObject:achieve atIndex:to];
}

#pragma mark -
#pragma mark Overrides
+(id)allocWithZone:(NSZone*)zone{
    return [self sharedStorage];
}

#pragma mark -
#pragma mark Initializers
-(id)init{
    self = [super init];
    
    if (self){
        achievements = [[NSMutableArray alloc] init];
    }

    return self;
}
@end
