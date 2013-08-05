//
//  DSAppDelegate.m
//  DaysSince
//
//  Created by Christopher Martin on 8/2/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "DSAppDelegate.h"
#import "DSAchievementViewController.h"
#import "DSAchievementStorage.h"

@implementation DSAppDelegate

#pragma mark -
#pragma mark Application Delegate Notifications
-(BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    _mainViewController = [[DSAchievementViewController alloc] init];
    
    UINavigationController* navController = [[UINavigationController alloc] initWithRootViewController:_mainViewController];
    [self.window setRootViewController:navController];
    
    
    UILocalNotification *notification =[launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    
    if (notification){
        DLog(@"Received notification %@", notification);
        
        NSString* title = [[notification userInfo] objectForKey:DSAchievementUserInfoKey];
        [_mainViewController showTrackingView:title];
    }
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    DLog(@"Received notification %@", notification);
    
    NSString* title = [[notification userInfo] objectForKey:DSAchievementUserInfoKey];
    
    [_mainViewController showTrackingView:title];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

-(void)applicationDidEnterBackground:(UIApplication*)application{
    BOOL didSave = [[DSAchievementStorage sharedStorage] persist];
    
    if (didSave){
        DLog(@"All achievements persisted");
    }else{
        DLog(@"Could not persist achievements");
    }
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
