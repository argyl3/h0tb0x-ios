//
//  HBAddFriendViewController.h
//  h0tb0x
//
//  Created by argyl3 on 4/23/14.
//  Copyright (c) 2014. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBAcquireFingerprintViewController.h"

@class HBAddFriendViewController;

@protocol HBAddFriendViewControllerDelegate <NSObject>
- (void)addFriendViewControllerDidCancel:(id)controller;
- (void)addFriendViewControllerDidSave:(id)controller;
@end



@interface HBAddFriendViewController : UIViewController<UITextFieldDelegate,HBAcquireFingerprintViewControllerDelegate>

@property IBOutlet UITextField* friendNameTextField;

@property (nonatomic, weak) IBOutlet id <HBAddFriendViewControllerDelegate> delegate;

- (IBAction)cancel:(id)sender;

@end

