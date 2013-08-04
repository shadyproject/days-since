//
//  TestableDSAchievementStorage.m
//  DaysSince
//
//  Created by Christopher Martin on 8/4/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "TestableDSAchievementStorage.h"

@implementation TestableDSAchievementStorage
-(NSString *)persistencePath{
    NSArray* documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    //grab the first directory
    NSString* documentDir = [documentDirectories objectAtIndex:0];
    
    return [documentDir stringByAppendingPathComponent:@"storage_test.archive"];
}

+(void)removeTestPersistenceFile{
    NSError* err;
    NSArray* documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    //grab the first directory
    NSString* documentDir = [documentDirectories objectAtIndex:0];
    
    NSString* pathToRemove = [documentDir stringByAppendingPathComponent:@"storage_test.archive"];
    
    
    if (![[NSFileManager defaultManager] removeItemAtPath:pathToRemove error:&err]){
        DLog(@"Error deleting file %@", err);
    };
}
@end
