//
//  HBFriendTableViewController.h
//  h0tb0x
//
//  Created by argyl3 on 4/22/14.
//  Copyright (c) 2014. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBAddFriendViewController.h"

@interface HBFriendTableViewController : UITableViewController<HBAddFriendViewControllerDelegate>

@property IBOutlet UIToolbar* headerToolbar;

@end
