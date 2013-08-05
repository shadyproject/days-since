//
//  DSAppDelegate.h
//  DaysSince
//
//  Created by Christopher Martin on 8/2/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DSAchievementViewController;

NSString* const DSAchievementUserInfoKey = @"achievement";

@interface DSAppDelegate : UIResponder <UIApplicationDelegate>
{
    DSAchievementViewController* _mainViewController;
}

@property (strong, nonatomic) UIWindow *window;

@end
