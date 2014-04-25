//
//  HBAcquireFingerprintViewController.h
//  h0tb0x
//
//  Created by argyl3 on 4/24/14.
//  Copyright (c) 2014. All rights reserved.
//

#import <UIKit/UIKit.h>


@class HBAcquireFingerprintViewController;

@protocol HBAcquireFingerprintViewControllerDelegate <NSObject>
- (void)acquireFingerprintViewControllerDidCancel:(id)controller;
- (void)acquireFingerprintViewControllerDidSave:(id)controller;
@end


@interface HBAcquireFingerprintViewController : UIViewController

@property NSString* friendName; // the friend's name as set in the HBAddFriendViewController

@property (nonatomic, weak) IBOutlet id <HBAcquireFingerprintViewControllerDelegate> delegate;

- (IBAction)cancel:(id)sender;

@end
