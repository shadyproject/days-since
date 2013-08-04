//
//  DSAchievementDetailViewController.m
//  DaysSince
//
//  Created by Christopher Martin on 8/3/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "DSAchievementDetailViewController.h"
#import "DSAchievement.h"

@implementation DSAchievementDetailViewController

@synthesize achievement;

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
    DLog(@"Delete the item from storage and hide myself here");
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
