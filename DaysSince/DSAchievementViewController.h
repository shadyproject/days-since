//
//  DSAchievementViewController.h
//  DaysSince
//
//  Created by Christopher Martin on 8/3/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DSAchievementViewController : UITableViewController
{
}
-(IBAction)addAchievement:(id)sender;
-(IBAction)showSettings:(id)sender;

-(void)showTrackingView:(NSString*)achievementTitle;
@end

