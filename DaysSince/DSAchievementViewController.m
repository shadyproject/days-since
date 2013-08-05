//
//  DSAchievementViewController.m
//  DaysSince
//
//  Created by Christopher Martin on 8/3/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "DSAchievementViewController.h"
#import "DSAchievement.h"
#import "DSAchievementStorage.h"
#import "DSAddAchievementViewController.h"
#import "DSAchievementDetailViewController.h"

@implementation DSAchievementViewController

#pragma mark -
#pragma mark Initializers
-(id)init{
    self = [super initWithStyle:UITableViewStyleGrouped];
    
    if (self){
        [self.navigationItem setTitle:@"Days Since I ..."]; //todo localize me
        
        UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                   target:self
                                                                                   action:@selector(addAchievement:)];
        //how is this not a default button?
        UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc] initWithTitle:@"\u2699"
                                                                           style:UIBarButtonItemStylePlain target:self action:@selector(showSettings:)];
        
        [self.navigationItem setRightBarButtonItem:settingsButton];
        [self.navigationItem setLeftBarButtonItem:addButton];
    }
    
    return self;
}

-(id)initWithStyle:(UITableViewStyle)style{
    return [self init];
}

#pragma mark -
#pragma mark TableView Methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[[DSAchievementStorage sharedStorage] allAchievements] count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell-Subtitle"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"TableViewCell-Subtitle"];
    }
    
    DSAchievement* achivement = [[[DSAchievementStorage sharedStorage] allAchievements] objectAtIndex:indexPath.row];
    
    cell.textLabel.text = achivement.achievement;
    
    NSDateFormatter* longFormatter = [[NSDateFormatter alloc] init];
    [longFormatter setDateStyle:NSDateFormatterLongStyle];
    
    NSString* subtitle =[NSString stringWithFormat:@"%@ on %@",
                         (achivement.startedOrStopped == DSAchievementTypeStarted ? @"started" : @"stopped"),
                         [longFormatter stringFromDate:achivement.firstDate]];
    
    cell.detailTextLabel.text = subtitle;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DSAchievement* achievement = [[[DSAchievementStorage sharedStorage] allAchievements] objectAtIndex:indexPath.row];
    
    DSAchievementDetailViewController *detailViewController = [[DSAchievementDetailViewController alloc] init];
    
    detailViewController.achievement = achievement;
    
    [self.navigationController pushViewController:detailViewController animated:YES];
}

#pragma mark -
#pragma mark Overrides
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

#pragma mark -
#pragma mark IBActions
-(IBAction)addAchievement:(id)sender{
    DSAddAchievementViewController *addViewController = [[DSAddAchievementViewController alloc] init];
    
    [self.navigationController pushViewController:addViewController animated:true];
}

-(IBAction)showSettings:(id)sender{
    DLog(@"Show the settings view here.");
}

@end
