//
//  DSAchievementDetailViewController.m
//  DaysSince
//
//  Created by Christopher Martin on 8/3/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "DSAchievementDetailViewController.h"
#import "DSAchievement.h"
#import "DSAchievementStorage.h"

@implementation DSAchievementDetailViewController

@synthesize achievement;

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
   
    switch (buttonIndex) {
        case 0:
            DLog(@"Keep tracking, dismiss ourself and do nothing");
            break;
            
        case 1:
            DLog(@"Deleting achievement");
            [[DSAchievementStorage sharedStorage] removeAchievement:achievement];
            [self.navigationController popToRootViewControllerAnimated:YES];
            
        default:
            break;
    }
    
}

#pragma mark -
#pragma mark Overrides
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
}

-(void)viewWillAppear:(BOOL)animated{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterLongStyle];
    _dateLabel.text = [NSString stringWithFormat:@"On %@", [dateFormatter stringFromDate:achievement.firstDate]];
    
    _startedStoppedLabel.text = [NSString stringWithFormat:@"I %@", (achievement.startedOrStopped == DSAchievementTypeStarted ? @"started" : @"stopped")];
    
    _achievementLabel.text = achievement.achievement;
    
    _currentStreakLabel.text = [NSString stringWithFormat:@"Thats %d days!", achievement.currentStreak];
    
    _longestStreakLabel.text = [NSString stringWithFormat:@"My longest streak is %d days.", achievement.longestStreak];
}

#pragma mark -
#pragma mark IBActions
-(IBAction)stopTracking:(id)sender{
    //todo prompt for confirmation here
    UIAlertView* confirmDeleteAlert = [[UIAlertView alloc] initWithTitle:@"Really stop tracking?" message:@"Are you sure you want to stop tracking this habit?  You're doing awesome so far!" delegate:self cancelButtonTitle:@"Keep Tracking" otherButtonTitles:@"Stop Tracking", nil];
    
    [confirmDeleteAlert show];
}

-(IBAction)postToTwitter:(id)sender{
    DLog(@"Post to twitter here");
}

-(IBAction)postToFacebook:(id)sender{
    DLog(@"Post to facebook here");
}
@end
