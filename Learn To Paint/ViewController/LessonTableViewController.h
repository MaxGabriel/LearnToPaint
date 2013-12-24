//
//  LessonTableViewController.h
//  Learn To Paint
//
//  Created by Jack Murdock on 10/14/13.
//  Copyright (c) 2013 Jack Murdock. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>

@interface LessonTableViewController : UITableViewController
<UISearchBarDelegate, UISearchDisplayDelegate>


@property (strong, nonatomic)NSMutableArray *filteredArray;

@property (strong, nonatomic) IBOutlet UISearchBar *searchLessons;

@end
