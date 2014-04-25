//
//  HBAcquireFingerprintViewController.m
//  h0tb0x
//
//  Created by argyl3 on 4/24/14.
//  Copyright (c) 2014 h0tb0x. All rights reserved.
//

#import "HBAcquireFingerprintViewController.h"

@interface HBAcquireFingerprintViewController ()

@end

@implementation HBAcquireFingerprintViewController

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
    
    self.title = @"Acquire Fingerprint";
}

- (IBAction)cancel:(id)sender
{
    [self.delegate acquireFingerprintViewControllerDidCancel: self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
