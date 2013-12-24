//
//  LessonTableViewController.m
//  Learn To Paint
//
//  Created by Jack Murdock on 10/14/13.
//  Copyright (c) 2013 Jack Murdock. All rights reserved.
//

#import "LessonTableViewController.h"
#import "SharedData.h"
#import "LessonObject.h"
#import "DetailsViewController.h"

@interface LessonTableViewController ()

@end

@implementation LessonTableViewController

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
    
    self.tableView.separatorColor = [UIColor darkGrayColor];
    [self.tableView setContentOffset:CGPointMake(0,44) animated:YES];
    
    
    _filteredArray = [NSMutableArray arrayWithCapacity:[[SharedData sharedData] count]];
    
    [[self tableView] reloadData];
}

-(void)viewWillAppear:(BOOL)animated
{
    [[self tableView] reloadData];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showLesson"])
    {
        DetailsViewController *lessonDestinationViewController = [segue destinationViewController];
        
        // In order to manipulate the destination view controller, another check on which table (search or normal) is displayed is needed
        if(sender == self.searchDisplayController.searchResultsTableView)
        {
            NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
            int row = [myIndexPath row];
            row = [[SharedData sharedData] indexOfObject:_filteredArray[row]];
            lessonDestinationViewController.row = row;
        }
        else {
            NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
            int row = [myIndexPath row];
            lessonDestinationViewController.row = row;
        }
    }
    if ([SKPaymentQueue canMakePayments])
    {
        if ([[segue identifier] isEqualToString:@"Store"])
        {
           // StoreTableViewController *viewController = [segue destinationViewController];
           // viewController.lessonList = [GobalData globalData];
            
            
        }
    } else {
        // Warn user that purchases are disabled
        UIAlertView *tmp = [[UIAlertView alloc] initWithTitle:@"Prohibited" message:@"Parental Control is enabled, cannot make a purchase!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
        [tmp show];
        
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    // Check to see whether the normal table or search results table is being displayed and return the count from the appropriate array
    if (tableView == self.searchDisplayController.searchResultsTableView)
	{
        return [_filteredArray count];
        
    }
	else
	{
        return [[SharedData sharedData] count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //static NSString *CellIdentifier = @"lesson";
    UITableViewCell *cell;// = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    int row = [indexPath row];
    // Configure the cell...
    BOOL firstLesson;
    if ([[[SharedData sharedData][row] identifierOfLesson] isEqualToString:@""]) {
        firstLesson = true;
    } else{
        firstLesson = false;
    }
    
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
  
        cell.textLabel.text = [_filteredArray[row] titleOfLesson];
        cell.imageView.image = [UIImage imageNamed:[_filteredArray[row] imageOfLesson] ];
        //cell.detailTextLabel.text = [[SharedData sharedData][row] descriptionOfLesson];
        
        BOOL productPurchased = [[NSUserDefaults standardUserDefaults]boolForKey:[_filteredArray[row] identifierOfLesson]];
        if (!productPurchased && !firstLesson)
        {
            cell.detailTextLabel.text = @"Purchase Lesson";
        } else{
            cell.detailTextLabel.text = @"";
        }
        return cell;
    } else {
        cell.textLabel.text = [[SharedData sharedData][row] titleOfLesson];
        cell.imageView.image = [UIImage imageNamed:[[SharedData sharedData][row] imageOfLesson] ];
        //cell.detailTextLabel.text = [[SharedData sharedData][row] descriptionOfLesson];
        BOOL productPurchased = [[NSUserDefaults standardUserDefaults]boolForKey:[[SharedData sharedData][row] identifierOfLesson]];
        if (!productPurchased &&!firstLesson)
        {
            cell.detailTextLabel.text = @"Purchase Lesson";
        } else{
            cell.detailTextLabel.text = @"";
        }

    }
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
    
    [self performSegueWithIdentifier:@"showLesson" sender:tableView];
    
}

#pragma mark Content Filtering

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    
	// Update the filtered array based on the search text and scope.
    
    // Remove all objects from the filtered search array
	[_filteredArray removeAllObjects];
    
    
	// Filter the array using NSPredicate
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.titleOfLesson contains[c] %@", searchText];
    NSArray *tempArray = [[SharedData sharedData] filteredArrayUsingPredicate:predicate];
    
    
    if(![scope isEqualToString:@"Other"]) {
        // Further filter the array with the scope
        NSPredicate *scopePredicate = [NSPredicate predicateWithFormat:@"SELF.categoryOfLesson contains[c] %@",scope];
        tempArray = [tempArray filteredArrayUsingPredicate:scopePredicate];
    }
    
    _filteredArray = [NSMutableArray arrayWithArray:tempArray];
    
    [self.tableView reloadData];
    
}

#pragma mark UISearchDisplayController Delegate Methods

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}


- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    [self filterContentForSearchText:[self.searchDisplayController.searchBar text] scope:
     [[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:searchOption]];
    
    // Return YES to cause the search result table view to be reloaded.
    return YES;
}


@end


