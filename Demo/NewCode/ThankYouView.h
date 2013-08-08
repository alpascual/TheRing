//
//  ThankYouView.h
//  SecretAdmire
//
//  Created by Albert Pascual on 8/24/11.
//  Copyright 2011 Al. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SA_OAuthTwitterController.h"
#import "MGTwitterEngine.h"

#import "FinishedView.h"

@interface ThankYouView : UIViewController
{
    UIActivityIndicatorView *activity;
    UIProgressView *progress;
    UILabel *progressLabel;
    NSMutableArray *allUsers;
    
    NSTimer *levelTimer;
    NSInteger pos;
    NSString *user;
}

//@property (nonatomic,retain) SA_OAuthTwitterEngine *engine;
@property (nonatomic,strong) MGTwitterEngine *engine;
@property (nonatomic,strong) IBOutlet UIActivityIndicatorView *activity;
@property (nonatomic,strong) IBOutlet UIProgressView *progress;
@property (nonatomic,strong) IBOutlet UILabel *progressLabel;
@property (nonatomic,strong) NSString *user;

@end
