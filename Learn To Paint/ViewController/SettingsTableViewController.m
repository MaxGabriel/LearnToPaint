//
//  SettingsTableViewController.m
//  Learn To Paint
//
//  Created by Jack Murdock on 10/14/13.
//  Copyright (c) 2013 Jack Murdock. All rights reserved.
//

#import "SettingsTableViewController.h"
#import "PaintingIAPHelper.h"
#import "iRate.h"
#include <sys/utsname.h>

@interface SettingsTableViewController ()

@end

@implementation SettingsTableViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    if (section == 0)
    {
        return 2;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    
    [cell setBackgroundColor:[UIColor darkTextColor]];
    [cell setTextColor:[UIColor whiteColor]];
    return cell;

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
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            [self sendProvideFeedBack];
        }
        if (indexPath.row == 1)
        {
            [self sendContactSupport];
        }
    }  else if (indexPath.section == 1)
    {
        [[iRate sharedInstance] promptForRating];
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
    }else if (indexPath.section == 2)
    {
        [[PaintingIAPHelper sharedInstance] restoreCompletedTransactions];
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
    }
    
    
}


#pragma Send Email

-(void)sendProvideFeedBack
{
    MFMailComposeViewController *composer=[[MFMailComposeViewController alloc]init];
    composer.mailComposeDelegate = (id)self;
    if ([MFMailComposeViewController canSendMail]) {
        [composer setToRecipients:[NSArray arrayWithObjects:@"kcajmagic@gmail.com", nil]];
        [composer setSubject:@"LearnToPaint_Provide_FeedBack"];
        
        //    [composer.setSubject.placeholder = [NSLocalizedString(@"This is a placeholder",)];
        
        [composer setMessageBody:@"Please tell us what you think below." isHTML:NO];
        [composer setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
        [self presentViewController:composer animated:YES completion:nil];
    }
    else {
    }
    
    
}

-(void)sendContactSupport
{
    
    NSString *version = [[UIDevice currentDevice] systemVersion];
    struct utsname u;
    uname(&u);
    char *type = u.machine;
    NSString *model = [NSString stringWithFormat:@"%s", type];
    NSString *dateString = [NSDateFormatter localizedStringFromDate:[NSDate date]
                                                          dateStyle:NSDateFormatterShortStyle
                                                          timeStyle:NSDateFormatterFullStyle];
    
    
    NSString *messageBody = [NSString stringWithFormat:@"Please describe your problem below so we can help you.\n\n\n\n\n\n\n\n\n\n\n\n\n-----DO NOT DELETE----- \n IOS version: %@ \nModel: %@ \nDate: %@",version, model, dateString];
    MFMailComposeViewController *composer=[[MFMailComposeViewController alloc]init];
    composer.mailComposeDelegate = (id)self;
    if ([MFMailComposeViewController canSendMail]) {
        [composer setToRecipients:[NSArray arrayWithObjects:@"kcajmagic@gmail.com", nil]];
        [composer setSubject:@"LearnToPaint_Contact_Support"];
        
        //    [composer.setSubject.placeholder = [NSLocalizedString(@"This is a placeholder",)];
        
        [composer setMessageBody:messageBody isHTML:NO];
        [composer setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
        [self presentViewController:composer animated:YES completion:nil];
    }
    else {
    }
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    
    if (error) {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"error" message:[NSString stringWithFormat:@"error %@",[error description]] delegate:nil cancelButtonTitle:@"dismiss" otherButtonTitles:nil, nil];
        [alert show];
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }
    else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}



@end
