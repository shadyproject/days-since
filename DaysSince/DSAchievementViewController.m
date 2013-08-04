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
#pragma mark UITableViewDataSource Methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[[DSAchievementStorage sharedStorage] allAchievements] count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableViewCell-Default"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TableViewCell-Default"];
    }
    
    //todo set this up to display how i want it with subtitle and such
    DSAchievement* achivement = [[[DSAchievementStorage sharedStorage] allAchievements] objectAtIndex:indexPath.row];
    cell.textLabel.text = achivement.description;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete){
        DSAchievement* toDelete = [[[DSAchievementStorage sharedStorage] allAchievements] objectAtIndex:indexPath.row];
        
        [[DSAchievementStorage sharedStorage] removeAchievement:toDelete];
        
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
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
