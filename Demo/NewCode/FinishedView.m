//
//  FinishedView.m
//  TheRing
//
//  Created by Albert Pascual on 8/28/11.
//  Copyright 2011 Al. All rights reserved.
//

#import "FinishedView.h"

@implementation FinishedView

@synthesize repeat, repeatLabel, friendCounter;
@synthesize list;

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
    // Do any additional setup after loading the view from its nib.
    
    if ( self.repeat == 1 )
    {
        self.repeatLabel.text = @"Already completed and you already in the list";
    }
    
    self.title = @"The Friends Ring";
    
    // request list of followers
    // grab a count
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://tweet.alsandbox.us/friends/count"]];
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *get = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    
    NSLog(@"Response adding into list %@", get );
    
    [get release];
    
    self.friendCounter.text = [[NSString alloc] initWithFormat:@"- There are %@ number of members right now", get];
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

- (IBAction)listPressed:(id)sender
{
    self.list = [[[UserList alloc] initWithNibName:@"UserList" bundle:nil] autorelease];
        
    [self.navigationController pushViewController:self.list animated:YES];
}

@end
