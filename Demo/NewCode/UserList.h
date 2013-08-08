//
//  UserList.h
//  TheRing
//
//  Created by Albert Pascual on 9/25/11.
//  Copyright 2011 Al. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserList : UITableViewController
{
    NSMutableArray *Userlist;
}
@property (nonatomic, strong) NSMutableArray *Userlist;

@end
