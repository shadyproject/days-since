//
//  DSSocialMediaController.m
//  DaysSince
//
//  Created by Christopher Martin on 8/4/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import "DSSocialMediaController.h"

@implementation DSSocialMediaController

-(BOOL)canPostToFacebook{
    return [SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook];
}

-(BOOL)canSendToTwitter{
    return [SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter];
}

-(UIViewController*)getControllerForTweet:(NSString*)tweet{
    SLComposeViewController* tweetController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    
    [tweetController setInitialText:tweet];
    
    return tweetController;
}

-(UIViewController*)getControllerForStatus:(NSString *)status{
    SLComposeViewController* fbController = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    
    [fbController setInitialText:status];
    
    return fbController;
}

@end
