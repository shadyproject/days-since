//
//  DSAchievementDetailViewController.m
//  DaysSince
//
//  Created by Christopher Martin on 8/3/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "DSAchievementDetailViewController.h"

@implementation DSAchievementDetailViewController

@synthesize achievement;

#pragma mark -
#pragma mark Overrides
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
}

-(void)viewWillAppear:(BOOL)animated{
    //draw the achievement info here
}

#pragma mark -
#pragma mark IBActions
-(IBAction)stopTracking:(id)sender{
    //todo prompt for confirmation here
    DLog(@"Delete the item from storage and hide myself here");
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
