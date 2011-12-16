//
//  OAuthTwitterDemoViewController.h
//  OAuthTwitterDemo
//
//  Created by Ben Gottlieb on 7/24/09.
//  Copyright Stand Alone, Inc. 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SA_OAuthTwitterController.h"

#import "SendTweetView.h"
#import "FinishedView.h"

@class SA_OAuthTwitterEngine;


@interface OAuthTwitterDemoViewController : UIViewController <SA_OAuthTwitterControllerDelegate> {
	SA_OAuthTwitterEngine				*_engine;

    NSTimer *levelTimer;
    UILabel *pleaseWaitLabel;
    UIButton *startButton;
    
    UINavigationController *navigationController;
    SendTweetView *send;
}

@property (nonatomic,retain) IBOutlet UILabel *pleaseWaitLabel;
@property (nonatomic,retain) IBOutlet UIButton *startButton;
@property (nonatomic,retain) UINavigationController *navigationController;
@property (nonatomic,retain) SendTweetView *send;

@end

