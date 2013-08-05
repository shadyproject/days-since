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
#import "DSSocialMediaController.h"

NSString* const DSAchievementUserInfoKey = @"achievement";

@implementation DSAddAchievementViewController

#pragma mark -
#pragma mark Initializer
-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self){
        _smController = [[DSSocialMediaController alloc] init];
    }
    
    return self;
}

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
    
    [self createNotificationForAchievement:achievement];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(IBAction)postToFacebook:(id)sender{
    NSString *status = [NSString stringWithFormat:@"Today I'm going to %@ %@ and keep track with the DaysSince app for iOS.",
                        (startedStoppedPicker.selectedSegmentIndex == 0 ? @"start" : @"stop"),
                         achievementText.text];
    
    DLog(@"Posting facebook status");
    
    [self presentViewController:[_smController getControllerForStatus:status] animated:YES completion:nil];
}

-(IBAction)postToTwitter:(id)sender{
    NSString* tweet = [NSString stringWithFormat:@"Today I'm %@ %@ with @dayssinceios",
                       (startedStoppedPicker.selectedSegmentIndex == 0 ? @"starting" : @"stopping"),
                       achievementText.text];
    
    DLog(@"Sending tweet %@", tweet);
    
    [self presentViewController:[_smController getControllerForTweet:tweet] animated:YES completion:nil];
}

#pragma mark -
#pragma mark UITextFieldDelegate Methods
-(BOOL)textFieldShouldReturn:(UITextField* )textField{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark -
-(void)createNotificationForAchievement:(DSAchievement*)a{
    //we want notifications to happen each day at noon
    //todo make the time notifications pop up configurable, or based on the time the alert is created
    //todo extract the notification creation into a method so we can write tests around it
    NSDateComponents* makeTomorrow = [[NSDateComponents alloc]init];
    makeTomorrow.day = 1;
    
    NSDate* tomorrow = [[NSCalendar currentCalendar] dateByAddingComponents:makeTomorrow toDate:[NSDate date] options:0];
    
    NSDateComponents* makeHighNoon = [[NSDateComponents alloc]init];
    makeHighNoon.hour = 12;
    makeHighNoon.minute = 0;
    makeHighNoon.second = 0;
    
    NSDate* tomorrowAtNoon = [[NSCalendar currentCalendar] dateByAddingComponents:makeHighNoon toDate:tomorrow options:0];
    
    UILocalNotification *notifyTomorrow = [[UILocalNotification alloc]init];
    notifyTomorrow.fireDate = tomorrowAtNoon;
    notifyTomorrow.timeZone = [NSTimeZone defaultTimeZone]; //set this so our alerts happen even if the user crosses time zones
    
    NSString* alert = [NSString stringWithFormat:@"How's%@ %@ going?",
                       (a.startedOrStopped == DSAchievementTypeStarted ? @"starting to" : @"stopping"),
                       a.achievement];
    
    notifyTomorrow.alertBody = alert;
    notifyTomorrow.soundName = UILocalNotificationDefaultSoundName; //todo make this a neat sound
    notifyTomorrow.repeatInterval = NSDayCalendarUnit;
    
    //see http://stackoverflow.com/questions/4637179/uilocalnotification-crash for why we don't store the whole achievment in the user info
    NSDictionary *info = [NSDictionary dictionaryWithObject:a.achievement forKey:DSAchievementUserInfoKey];
    notifyTomorrow.userInfo = info;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notifyTomorrow];
}
@end
