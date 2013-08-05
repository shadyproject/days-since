//
//  DSSocialMediaController.h
//  DaysSince
//
//  Created by Christopher Martin on 8/4/13.
//  Copyright (c) 2013 Shadyproject. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Social/Social.h>

@interface DSSocialMediaController : NSObject

-(BOOL)canSendToTwitter;
-(BOOL)canPostToFacebook;
-(UIViewController*)getControllerForTweet:(NSString*)tweet;
-(UIViewController*)getControllerForStatus:(NSString*)status;
@end
