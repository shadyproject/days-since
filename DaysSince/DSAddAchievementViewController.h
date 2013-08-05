//
//  DSAddAchievementViewController.h
//  DaysSince
//
//  Created by Christopher Martin on 8/3/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DSAchievement;

@interface DSAddAchievementViewController : UIViewController <UINavigationControllerDelegate, UITextFieldDelegate>
{
    __weak IBOutlet UISegmentedControl *startedStoppedPicker;
    __weak IBOutlet UITextField* achievementText;
}

-(IBAction)startTracking:(id)sender;
-(IBAction)postToTwitter:(id)sender;
-(IBAction)postToFacebook:(id)sender;
@end