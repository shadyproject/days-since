//
//  DSUpdateAchievementViewController.m
//  DaysSince
//
//  Created by Christopher Martin on 8/4/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "DSUpdateAchievementViewController.h"
#import "DSAchievement.h"

@implementation DSUpdateAchievementViewController

@synthesize achievement;

-(void)viewWillAppear:(BOOL)animated{
    _achievementLabel.text = self.achievement.achievement;
}

-(IBAction)completedAchievement:(id)sender{
    DLog(@"Completed achivement for %@", [NSDate date]);
    [self updateAchievementWithStatus:YES];
}

-(IBAction)skippedAchievement:(id)sender{
    DLog(@"Missinge acheivement for %@.  Reset counts", [NSDate date]);
    [self updateAchievementWithStatus:NO];
}

-(void)updateAchievementWithStatus:(BOOL)didComplete{
    if (didComplete){
        DLog(@"Keep the streak alive.");
    }else{
        DLog(@"Reset the current streak and update longest streak or whatever.");
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
