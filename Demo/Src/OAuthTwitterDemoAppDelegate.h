//
//  OAuthTwitterDemoAppDelegate.h
//  OAuthTwitterDemo
//
//  Created by Ben Gottlieb on 7/24/09.
//  Copyright Stand Alone, Inc. 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@class OAuthTwitterDemoViewController;

@interface OAuthTwitterDemoAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    OAuthTwitterDemoViewController *viewController;
}

@property (nonatomic, strong) IBOutlet UIWindow *window;
@property (nonatomic, strong) IBOutlet OAuthTwitterDemoViewController *viewController;

@end

