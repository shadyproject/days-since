//
//  DSUpdateAchievementViewController.h
//  DaysSince
//
//  Created by Christopher Martin on 8/4/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DSAchievement;

@interface DSUpdateAchievementViewController : UIViewController <UINavigationControllerDelegate>
{
    __weak IBOutlet UILabel* _achievementLabel;
}

@property (nonatomic, strong) DSAchievement* achievement;

-(IBAction)completedAchievement:(id)sender;
-(IBAction)skippedAchievement:(id)sender;

@end
