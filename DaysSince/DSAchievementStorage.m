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

-(void)addAchievement:(DSAchievement *)achieve{
    [achievements addObject:achieve];
}

-(void)removeAchievement:(DSAchievement *)achieve{
    [achievements removeObjectIdenticalTo:achieve];
}

-(NSString *)persistencePath{
    NSArray* documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    //grab the first directory
    NSString* documentDir = [documentDirectories objectAtIndex:0];
    
    return [documentDir stringByAppendingPathComponent:@"achievements.archive"];
}

-(BOOL)persist{
    NSString* path = [self persistencePath];
    
    return [NSKeyedArchiver archiveRootObject:achievements toFile:path];
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
        NSString* path = [self persistencePath];
        achievements = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        
        //if nothing was saved, create it from scratch
        if (!achievements) {
            achievements = [[NSMutableArray alloc] init];
        }
    }

    return self;
}
@end
