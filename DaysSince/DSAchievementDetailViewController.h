//
//  DSAchievementDetailViewController.h
//  DaysSince
//
//  Created by Christopher Martin on 8/3/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DSAchievement;

@interface DSAchievementDetailViewController : UIViewController <UINavigationControllerDelegate, UIAlertViewDelegate>
{
    //todo instead of using all these labels,
    //we should just draw the text into the view with attributes
    __weak IBOutlet UILabel* _dateLabel;
    __weak IBOutlet UILabel* _startedStoppedLabel;
    __weak IBOutlet UILabel* _achievementLabel;
    __weak IBOutlet UILabel* _currentStreakLabel;
    __weak IBOutlet UILabel* _longestStreakLabel;
    __weak IBOutlet UILabel* _randomFactLabel;
}

@property (nonatomic, strong) DSAchievement* achievement;

-(IBAction)stopTracking:(id)sender;
@end
