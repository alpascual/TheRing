//
//  FinishedView.h
//  TheRing
//
//  Created by Albert Pascual on 8/28/11.
//  Copyright 2011 Al. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserList.h"

@interface FinishedView : UIViewController
{
    NSInteger repeat;
    UILabel *repeatLabel;
    
    UILabel *friendCounter;
    
    UserList *list;
}

@property (nonatomic) NSInteger repeat;
@property (nonatomic,retain) IBOutlet UILabel *repeatLabel;
@property (nonatomic,retain) IBOutlet UILabel *friendCounter;
@property (nonatomic,retain) UserList *list;

- (IBAction)listPressed:(id)sender;

@end
