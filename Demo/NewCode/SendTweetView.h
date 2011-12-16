//
//  SendTweetView.h
//  SecretAdmire
//
//  Created by Albert Pascual on 8/24/11.
//  Copyright 2011 Al. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThankYouView.h"
#import "SA_OAuthTwitterController.h"


@interface SendTweetView : UIViewController
{    
    UILabel *user;
    UIButton *send;
    
    NSString *Username;
    SA_OAuthTwitterEngine *_engine;
    
    UILabel *countUsers;
    NSInteger repeat;
}


@property (nonatomic,retain) IBOutlet UILabel *user;
@property (nonatomic,retain) IBOutlet UIButton *send;
@property (nonatomic,retain) NSString *Username;
@property (nonatomic,retain) SA_OAuthTwitterEngine *_engine;
@property (nonatomic,retain) IBOutlet UILabel *countUsers;
@property (nonatomic) NSInteger repeat;

- (IBAction)sendTweetPressed;

@end
