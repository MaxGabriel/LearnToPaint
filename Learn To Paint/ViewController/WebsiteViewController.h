//
//  WebsiteViewController.h
//  Learn To Paint
//
//  Created by Jack Murdock on 10/14/13.
//  Copyright (c) 2013 Jack Murdock. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import "Download.h" 
#import "MBProgressHUD.h"

@interface WebsiteViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate, DownloadDelegate, MBProgressHUDDelegate>

@property (strong, nonatomic) IBOutlet UIView *tableFrame;
@property (strong, nonatomic) IBOutlet UIButton *emailButton;
@property (strong, nonatomic) IBOutlet UILabel *artworkTitle;
@property (strong, nonatomic) IBOutlet UILabel *artworkCost;
@property (strong, nonatomic) IBOutlet UIImageView *artworkPhoto;
@property (strong, nonatomic) IBOutlet UITextView *artworkDetail;
@property (strong, nonatomic) IBOutlet UITableView *mainTable;
- (IBAction)sendEmail:(UIButton *)sender;
- (IBAction)updateFiles:(UIButton *)sender;


@end
