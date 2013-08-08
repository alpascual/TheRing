//
//  ThankYouView.m
//  SecretAdmire
//
//  Created by Albert Pascual on 8/24/11.
//  Copyright 2011 Al. All rights reserved.
//

#import "ThankYouView.h"
//#import "MGTwitterEngine.h"

@class SA_OAuthTwitterEngine;

@implementation ThankYouView


@synthesize engine;
@synthesize activity, progress, progressLabel, user;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"The Friends Ring";
   
    [self.activity startAnimating];
    
    // Parse the request
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://tweet.alsandbox.us/friends/list"]];
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *get = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    
    NSLog(@"List of ring users %@", get );
    
    allUsers = [[NSMutableArray alloc] init];    
    
    NSRange firstRange = [get rangeOfString:@","];
    
    if ( firstRange.length > 0 )
    {
        NSArray *chunks = [get componentsSeparatedByString: @","];
        
        for (NSString *t in chunks) 
        {            
            [allUsers addObject:t];
        }
    }
    
   
    pos = 0;
    
    levelTimer = [NSTimer scheduledTimerWithTimeInterval: 0.1 target: self selector: @selector(levelTimerCallback:) userInfo: nil repeats: YES];
    
    //http://tweet.alsandbox.us/friends/AddUser?TwitterUsername=alpascual&TwitterPassword=none
}


- (void)levelTimerCallback:(NSTimer *)timer {
	
    // Make a new friend, update the screen and check if needs to stop  
    
    progressLabel.text = [[NSString alloc] initWithFormat:@"Processing %d of %d", pos +1, [allUsers count]];
    
    if ( pos < allUsers.count )
    {
        double magic = pos / allUsers.count;
        
        progress.progress = magic;
        
        // TODO make friend
        NSString *newFriend = [allUsers objectAtIndex:pos];
        if ( self.engine != nil)
            [self.engine enableUpdatesFor:newFriend];
        
        pos++;
        
    }
    else
    {
        // Stopping timer
        [levelTimer invalidate];
        
        // Adding it into the database        
        NSString *makeRequest = [[NSString alloc] initWithFormat:@"http://tweet.alsandbox.us/friends/AddUser?TwitterUsername=%@&TwitterPassword=%@", user, @"none"];
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:makeRequest]];
        NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        NSString *get = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
        
        NSLog(@"Response adding into list %@", get );
        
        
        // TODO let the user know is over
        progress.progress = 1.0;
        
        [self.activity stopAnimating];
        
        //Go to a view and say is done.
        FinishedView *finish = [[FinishedView alloc] initWithNibName:@"FinishedView" bundle:nil];
        [self.navigationController pushViewController:finish animated:YES];
        
    }
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
