//
//  SendTweetView.m
//  SecretAdmire
//
//  Created by Albert Pascual on 8/24/11.
//  Copyright 2011 Al. All rights reserved.
//

#import "SendTweetView.h"

@implementation SendTweetView

@synthesize user, send, Username, _engine, countUsers, repeat;

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
    // Do any additional setup after loading the view from its nib.
    
    //TEST THIS
    /*NSString *someText = @"I downloaded FollowersRing from the App Store by @alpascual.";
    SHKItem *item = [SHKItem text:someText];
    
    // Share the item    
    [SHKTwitter shareItem:item];*/
    
    /*if ( Username == nil || Username.length == 0 )
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:[NSString stringWithFormat:@"You need to set up a twitter user"]
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"                                          
                                              otherButtonTitles:nil];
        
        [alert show];
        
        return;
    }*/
    
    
    user.text = Username;
    
    // grab a count
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://tweet.alsandbox.us/friends/count"]];
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *get = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    
    NSLog(@"Response adding into list %@", get );
    
    [get release];
    
    self.countUsers.text = [[NSString alloc] initWithFormat:@"- There are %@ number of members right now", get];
    
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

- (IBAction)sendTweetPressed
{
    // Send Tweet
//    if ( user.text.length == 0 )
//        return;
//        
    //send/message?sUsername=mytest&sMessage=Hello
    //TODO Message text needs to be encoded for the url
    /*NSString *myRequestString = [[NSString alloc] initWithFormat:@"http://tweet.alsandbox.us/friends/AddUser?TwitterUsername=%@&TwitterPassword=%@", user.text, @"none"];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:myRequestString]];
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *get = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    NSLog(@"response: %@", get);
    
    [myRequestString release];*/
    
    ThankYouView *thanks = [[ThankYouView alloc] initWithNibName:@"ThankYouView" bundle:nil];
    thanks._engine = self._engine;
    thanks.user = user.text;
    
    [self.navigationController pushViewController:thanks animated:YES];

}

@end
