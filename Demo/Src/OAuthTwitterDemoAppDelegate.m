//
//  OAuthTwitterDemoAppDelegate.m
//  OAuthTwitterDemo
//
//  Created by Ben Gottlieb on 7/24/09.
//  Copyright Stand Alone, Inc. 2009. All rights reserved.
//

#import "OAuthTwitterDemoAppDelegate.h"
#import "OAuthTwitterDemoViewController.h"

@implementation OAuthTwitterDemoAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    
    [Parse setApplicationId:@"hU487kY2HQQprFMl28SxvtUWwBhQAjUOly9VTnTt"
                  clientKey:@"hbgAVSQabvRTQoaJ37jyt3BRsJjqY9BFUAeMHi8h"];
    
    //[PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}




@end
