//
//  DSAddAchievementViewController.m
//  DaysSince
//
//  Created by Christopher Martin on 8/3/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "DSAddAchievementViewController.h"
#import "DSAchievement.h"
#import "DSAchievementStorage.h"

@implementation DSAddAchievementViewController

#pragma mark -
#pragma mark Overrides

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
}

#pragma mark -
#pragma mark IBActions
-(IBAction)startTracking:(id)sender{
    
    [self.view endEditing:YES];
    //it might be cleaner to use the event to handle this, but it works for now
    DSAchievementType startedOrStopped = (startedStoppedPicker.selectedSegmentIndex == 0 ? DSAchievementTypeStarted : DSAchievementTypeStopped);
    DSAchievement* achievement = [[DSAchievement alloc] initWithAchievement:achievementText.text startedOrStopped:startedOrStopped];
    
    [[DSAchievementStorage sharedStorage] addAchievement:achievement];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark UITextFieldDelegate Methods
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}
@end
