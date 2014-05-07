//
//  HBFriendTableViewController.m
//  HotBox
//
//  Created by argyl3 on 4/22/14.
//  Copyright (c) 2014 General UI LLC. All rights reserved.
//

#import "HBFriendTableViewController.h"
#import "HBFriend.h"

@interface HBFriendTableViewController ()

@property (strong) NSArray* friends;

@end

@implementation HBFriendTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.title = @"h0tb0x Friends";
    
    self.friends = [HBFriend allFriends];
    
    self.tableView.tableHeaderView = self.headerToolbar;
}


- (void)addFriendViewControllerDidCancel:(id)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)addFriendViewControllerDidSave:(id)controller
{
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // todo: later alphabetize in sections, hooray
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSInteger count = [self.friends count];

    if (count < 1) return 1;    // for the (no friends yet) cell
    else return count;
}

- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return nil; // @"HotBox Friends";
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row >= [self.friends count])
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"noFriendsCell" forIndexPath:indexPath];
        
        if (indexPath.row == 0)
        {
            cell.textLabel.text = @"[no friends yet]";
            cell.detailTextLabel.text = @"";
        }
        
        return cell;
    }
    else
    {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"friendCell" forIndexPath:indexPath];
    
        cell.textLabel.text = [self.friends objectAtIndex: indexPath.row];
        cell.detailTextLabel.text = @"00:11:22:33:44:55:66:77:88";
     
        return cell;
    }
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddFriendSegue"])
    {
        UINavigationController* navigationController = segue.destinationViewController;
        HBAddFriendViewController* addFriendViewController = navigationController.viewControllers[0];
        addFriendViewController.delegate = self;
    }
}


@end
