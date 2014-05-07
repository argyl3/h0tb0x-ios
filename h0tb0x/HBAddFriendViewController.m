//
//  HBAddFriendViewController.m
//  HotBox
//
//  Created by argyl3 on 4/23/14.
//  Copyright (c) 2014 General UI LLC. All rights reserved.
//

#import "HBAddFriendViewController.h"
#import "HBAcquireFingerprintViewController.h"

@interface HBAddFriendViewController ()

@end

@implementation HBAddFriendViewController

BOOL canceled;  // iOS storyboard perversions require such nonsense

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Add Friend";
}

- (void) viewWillAppear:(BOOL)animated
{
    canceled = NO;
    [self.friendNameTextField becomeFirstResponder];
}


- (IBAction)cancel:(id)sender
{
    canceled = YES;
    [self.delegate addFriendViewControllerDidCancel: self];
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - AcquireFingerprintViewControllerDelegate

- (void)acquireFingerprintViewControllerDidCancel:(id)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)acquireFingerprintViewControllerDidSave:(id)controller
{
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if ([identifier isEqualToString:@"AcquireFingerprintSegue"] && canceled)
    {
        canceled = NO;
        return NO;
    }
    
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"segue.identifier is %@", segue.identifier);
    if ([segue.identifier isEqualToString:@"AcquireFingerprintSegue"])
    {
        UINavigationController* navigationController = segue.destinationViewController;
        HBAcquireFingerprintViewController* acquireFingerprintViewController = navigationController.viewControllers[0];
        acquireFingerprintViewController.delegate = self;
        acquireFingerprintViewController.friendName = self.friendNameTextField.text;
    }
}


@end
