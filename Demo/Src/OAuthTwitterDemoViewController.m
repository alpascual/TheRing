//
//  OAuthTwitterDemoViewController.m
//  OAuthTwitterDemo
//
//  Created by Ben Gottlieb on 7/24/09.
//  Copyright Stand Alone, Inc. 2009. All rights reserved.
//

#import "OAuthTwitterDemoViewController.h"
#import "SA_OAuthTwitterEngine.h"


//#define kOAuthConsumerKey				@"cmU4OoYsh1QODUePBSWsug"		//REPLACE ME
//#define kOAuthConsumerSecret			@"kD7wqsZgZOHRW65x9biqLuWPqEKavAQbvSwqCNgT8"		//REPLACE ME
#define kOAuthConsumerKey	@"yASjbX9Zbu1OD0gk89qExA"
#define kOAuthConsumerSecret @"mTDH5xPm6Fu1KS3m1NUVTWKXBXi330TCakspt5Dz060"	

@implementation OAuthTwitterDemoViewController

@synthesize pleaseWaitLabel,startButton;
@synthesize navigationController, send;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    levelTimer = [NSTimer scheduledTimerWithTimeInterval: 1.0 target: self selector: @selector(levelTimerCallback:) userInfo: nil repeats: NO];
    
}

- (void)levelTimerCallback:(NSTimer *)timer {
	
    pleaseWaitLabel.hidden = YES;
    startButton.hidden = NO;    
}


//=============================================================================================================================
#pragma mark SA_OAuthTwitterEngineDelegate
- (void) storeCachedTwitterOAuthData: (NSString *) data forUsername: (NSString *) username {
	NSUserDefaults			*defaults = [NSUserDefaults standardUserDefaults];

	[defaults setObject: data forKey: @"authData"];
	[defaults synchronize];
}

- (NSString *) cachedTwitterOAuthDataForUsername: (NSString *) username {
	return [[NSUserDefaults standardUserDefaults] objectForKey: @"authData"];
}

//=============================================================================================================================
#pragma mark SA_OAuthTwitterControllerDelegate
- (void) OAuthTwitterController: (SA_OAuthTwitterController *) controller authenticatedWithUsername: (NSString *) username {
	NSLog(@"Authenicated for %@", username);
}

- (void) OAuthTwitterControllerFailed: (SA_OAuthTwitterController *) controller {
	NSLog(@"Authentication Failed!");
}

- (void) OAuthTwitterControllerCanceled: (SA_OAuthTwitterController *) controller {
	NSLog(@"Authentication Canceled.");
}

//=============================================================================================================================
#pragma mark TwitterEngineDelegate
- (void) requestSucceeded: (NSString *) requestIdentifier {
	NSLog(@"Request %@ succeeded", requestIdentifier);
}

- (void) requestFailed: (NSString *) requestIdentifier withError: (NSError *) error {
	NSLog(@"Request %@ failed with error: %@", requestIdentifier, error);
}



//=============================================================================================================================
#pragma mark ViewController Stuff
- (void) viewDidAppear: (BOOL)animated {
	if (_engine) return;
	_engine = [[SA_OAuthTwitterEngine alloc] initOAuthWithDelegate: self];
	_engine.consumerKey = kOAuthConsumerKey;
	_engine.consumerSecret = kOAuthConsumerSecret;
	
	UIViewController			*controller = [SA_OAuthTwitterController controllerToEnterCredentialsWithTwitterEngine: _engine delegate: self];
	
    NSLog(@"username: %@", _engine.username);
     //self.send.Username = _engine.username;
    
    //TEST THIS NOW!! TODO TODO
     self.send = [[SendTweetView alloc] initWithNibName:@"SendTweetView" bundle:nil];
    self.send.Username = _engine.username;
    
	if (controller) 
		[self presentModalViewController: controller animated: YES];
	else {
        
        NSLog(@"The Usersname is : %@" , _engine.username);
        
        // Save
        NSUserDefaults *myPrefs = [NSUserDefaults standardUserDefaults];    
        if ( [myPrefs stringForKey:@"username"] != nil )
        {
            NSString *tempUser = [myPrefs objectForKey:@"username"]; 
            if ( [tempUser isEqualToString:_engine.username] == YES )
            {
                self.send.repeat = 1;                
            }
        }
        
        else {
            [myPrefs setObject:_engine.username forKey:@"username"];
            [myPrefs synchronize];
        }
        
        //sends a tweet if was all updated. Disable for now
		//[_engine sendUpdate: [NSString stringWithFormat: @"Already Updated. %@", [NSDate date]]];
        
        // Make a friend
        //[_engine enableUpdatesFor:@"mynewfriend"];
        
        [myPrefs synchronize];
	}

}

- (IBAction)buttonPressed
{   
    if ( self.send.repeat == 1 )
    {
        //Go to a view and say is done.
        FinishedView *finish = [[FinishedView alloc] initWithNibName:@"FinishedView" bundle:nil];
        finish.repeat = 1;
        if ( self.navigationController == nil )
            self.navigationController = [[UINavigationController alloc] initWithRootViewController:finish];       
    
    }
    
    else
    {
        NSLog(@"Username: %@", _engine.username);
        self.send.Username = _engine.username;
        self.send._engine = _engine;
        
        if ( self.navigationController == nil )
            self.navigationController = [[UINavigationController alloc] initWithRootViewController:self.send];
    }
    
    
    [self.view.window addSubview: [navigationController view]];
    [self.view.window makeKeyAndVisible];
        
    
    //[self.navigationController pushViewController:send animated:YES];
}

@end
