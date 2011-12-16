//
//  ThankYouView.h
//  SecretAdmire
//
//  Created by Albert Pascual on 8/24/11.
//  Copyright 2011 Al. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SA_OAuthTwitterController.h"
#import "FinishedView.h"

@interface ThankYouView : UIViewController
{
    SA_OAuthTwitterEngine *_engine;
    
    UIActivityIndicatorView *activity;
    UIProgressView *progress;
    UILabel *progressLabel;
    NSMutableArray *allUsers;
    
    NSTimer *levelTimer;
    NSInteger pos;
    NSString *user;
}

@property (nonatomic,retain) SA_OAuthTwitterEngine *_engine;
@property (nonatomic,retain) IBOutlet UIActivityIndicatorView *activity;
@property (nonatomic,retain) IBOutlet UIProgressView *progress;
@property (nonatomic,retain) IBOutlet UILabel *progressLabel;
@property (nonatomic,retain) NSString *user;

@end
