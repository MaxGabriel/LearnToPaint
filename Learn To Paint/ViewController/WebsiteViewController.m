//
//  WebsiteViewController.m
//  Learn To Paint
//
//  Created by Jack Murdock on 10/14/13.
//  Copyright (c) 2013 Jack Murdock. All rights reserved.
//

#import "WebsiteViewController.h"
#import "Oeuvre.h"
#import "Artwork.h"
#import "ArtworkParser.h"
#import "SharedData.h"
#import "Download.h"
#import "MBProgressHUD.h"
#import <SDWebImage/UIImageView+WebCache.h>


@interface WebsiteViewController ()
@property int indexValue;  //Last selected
@property (nonatomic, strong) Download *mainDownloader;
@property (nonatomic, strong) Oeuvre *oeuvre;
@property (nonatomic, strong) NSString *prefixFile;
@property (nonatomic, strong) MBProgressHUD *downloadView;
@property (nonatomic, strong) UIView *emptyView;
@property int downloadIndex;

@end

@implementation WebsiteViewController

-(void)viewWillAppear:(BOOL)animated
{
    //Check orientation
    // float duration = .2;
    if([[UIDevice currentDevice] orientation] == UIInterfaceOrientationLandscapeLeft || [[UIDevice currentDevice] orientation] == UIInterfaceOrientationLandscapeRight)
    {
        
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 480)
        {
            //iphone small
            
            _artworkPhoto.frame = CGRectMake(10, 71, 124, 173);
            _artworkDetail.frame = CGRectMake(139, 71, 168, 173);
            _tableFrame.frame = CGRectMake(308, 71, 161, 173);
            _artworkTitle.frame = CGRectMake(31, 0, 296, 21);
            _artworkCost.frame = CGRectMake(348, 0, 124, 21);
            _emailButton.frame = CGRectMake(94, 29, 293, 33);
        } else if(result.height == 568)
        {
            //iphone 5
            
            _artworkPhoto.frame = CGRectMake(10, 71, 135, 173);
            _artworkDetail.frame = CGRectMake(153, 71, 229, 173);
            _tableFrame.frame = CGRectMake(387, 71, 161, 173);
            _artworkTitle.frame = CGRectMake(70, 2, 298, 21);
            _artworkCost.frame = CGRectMake(433, 2, 115, 21);
            _emailButton.frame = CGRectMake(135, 31, 298, 29);
            
        } else {
            //ipad
            
            _artworkPhoto.frame = CGRectMake(20, 80, 304, 332);
            _artworkDetail.frame = CGRectMake(20, 420, 984, 420);
            _tableFrame.frame = CGRectMake(332, 80, 672, 332);
            _artworkTitle.frame = CGRectMake(57, 0, 728, 32);
            _artworkCost.frame = CGRectMake(621, 0, 383, 32);
            _emailButton.frame = CGRectMake(366, 40, 293, 33);
        }
    } else if ([[UIDevice currentDevice] orientation] == UIInterfaceOrientationPortrait)
    {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 480)
        {
            //iphone small
            
            _artworkTitle.frame = CGRectMake(11, 0, 296, 21);
            _artworkCost.frame = CGRectMake(97, 20, 124, 21);
            _artworkPhoto.frame = CGRectMake(14, 49, 124, 181);
            _tableFrame.frame = CGRectMake(147, 49, 161, 182);
            _artworkDetail.frame = CGRectMake(14, 238, 293, 125);
            _emailButton.frame = CGRectMake(14, 371, 293, 33);
            
            
        } else if(result.height == 568)
        {
            //iphone 5
            
            _artworkTitle.frame = CGRectMake(10, 0, 298, 21);
            _artworkCost.frame = CGRectMake(102, 29, 115, 25);
            _artworkPhoto.frame = CGRectMake(10, 62, 135, 182);
            _tableFrame.frame = CGRectMake(147, 62, 161, 182);
            _artworkDetail.frame = CGRectMake(10, 252, 298, 202);
            _emailButton.frame = CGRectMake(10, 462, 298, 29);
            
        } else {
            //ipad
            _artworkPhoto.frame = CGRectMake(20, 106, 357, 442);
            _artworkDetail.frame = CGRectMake(20, 556, 728, 339);
            _tableFrame.frame = CGRectMake(385, 106, 363, 442);
            _artworkTitle.frame = CGRectMake(20, 0, 728, 41);
            _artworkCost.frame = CGRectMake(193, 49, 383, 32);
            _emailButton.frame = CGRectMake(238, 903, 293, 33);
        }
    }
    
    
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    
    if(toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
    {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 480)
        {
            //iphone small
            [UIView animateWithDuration:duration animations:^(void){
                _artworkPhoto.frame = CGRectMake(10, 71, 124, 173);
                _artworkDetail.frame = CGRectMake(139, 71, 168, 173);
                _tableFrame.frame = CGRectMake(308, 71, 161, 173);
                _artworkTitle.frame = CGRectMake(31, 0, 296, 21);
                _artworkCost.frame = CGRectMake(348, 0, 124, 21);
                _emailButton.frame = CGRectMake(94, 29, 293, 33);
                
            }];
            [UIView commitAnimations];
            
        } else if(result.height == 568)
        {
            //iphone 5
            [UIView animateWithDuration:duration animations:^(void){
                _artworkPhoto.frame = CGRectMake(10, 71, 135, 173);
                _artworkDetail.frame = CGRectMake(153, 71, 229, 173);
                _tableFrame.frame = CGRectMake(387, 71, 161, 173);
                _artworkTitle.frame = CGRectMake(70, 2, 298, 21);
                _artworkCost.frame = CGRectMake(433, 2, 115, 21);
                _emailButton.frame = CGRectMake(135, 31, 298, 29);
            }];
            [UIView commitAnimations];
            
            
            
        } else {
            //ipad
            [UIView animateWithDuration:duration animations:^(void){
                _artworkPhoto.frame = CGRectMake(20, 80, 304, 332);
                _artworkDetail.frame = CGRectMake(20, 420, 984, 420);
                _tableFrame.frame = CGRectMake(332, 80, 672, 332);
                _artworkTitle.frame = CGRectMake(57, 0, 728, 32);
                _artworkCost.frame = CGRectMake(621, 0, 383, 32);
                _emailButton.frame = CGRectMake(366, 40, 293, 33);
                
            }];
            [UIView commitAnimations];
        }
    } else if (toInterfaceOrientation == UIInterfaceOrientationPortrait)
    {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 480)
        {
            //iphone small
            [UIView animateWithDuration:duration animations:^(void){
                _artworkTitle.frame = CGRectMake(11, 0, 296, 21);
                _artworkCost.frame = CGRectMake(97, 20, 124, 21);
                _artworkPhoto.frame = CGRectMake(14, 49, 124, 181);
                _tableFrame.frame = CGRectMake(147, 49, 161, 182);
                _artworkDetail.frame = CGRectMake(14, 238, 293, 125);
                _emailButton.frame = CGRectMake(14, 371, 293, 33);
            }];
            [UIView commitAnimations];
            
        } else if(result.height == 568)
        {
            //iphone 5
            [UIView animateWithDuration:duration animations:^(void){
                _artworkTitle.frame = CGRectMake(10, 0, 298, 21);
                _artworkCost.frame = CGRectMake(102, 29, 115, 25);
                _artworkPhoto.frame = CGRectMake(10, 62, 135, 182);
                _tableFrame.frame = CGRectMake(147, 62, 161, 182);
                _artworkDetail.frame = CGRectMake(10, 252, 298, 202);
                _emailButton.frame = CGRectMake(10, 462, 298, 29);
            }];
            [UIView commitAnimations];
            
            
            
        } else {
            //ipad
            [UIView animateWithDuration:duration animations:^(void){
                _artworkPhoto.frame = CGRectMake(20, 106, 357, 442);
                _artworkDetail.frame = CGRectMake(20, 556, 728, 339);
                _tableFrame.frame = CGRectMake(385, 106, 363, 442);
                _artworkTitle.frame = CGRectMake(20, 0, 728, 41);
                _artworkCost.frame = CGRectMake(193, 49, 383, 32);
                _emailButton.frame = CGRectMake(238, 903, 293, 33);
            }];
            [UIView commitAnimations];
        }
        
    }
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    _mainTable.dataSource = self;
    _mainTable.delegate = self;
    _mainDownloader = [[Download alloc] init];
    _mainDownloader.delegate = self;
    
    _oeuvre = [[Oeuvre alloc] init];
    
    _downloadView = [[MBProgressHUD alloc] init];
    _downloadView.delegate = self;
    
    
    [self.view addSubview:_downloadView];
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"Oeuvre.xml"];
    _prefixFile = documentsPath;
    
//    if([[NSFileManager defaultManager] fileExistsAtPath:filePath])
//    {
//        
//    }
    
    _oeuvre = [ArtworkParser loadOeuvre:filePath];
    
    [self loadUI];
    
    
    
}

-(void)loadUI
{
    
    if ([_oeuvre.artworks count] < 1)
    {
        // Load empty view
        CGSize result = [[UIScreen mainScreen] bounds].size;
        _emptyView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, result.width, result.height)];
        _emptyView.backgroundColor = [UIColor blackColor];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button setTitle:@"Download Data" forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont fontWithName:@"Chalkduster" size:30];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(updateFiles:) forControlEvents:UIControlEventTouchUpInside];
        button.frame = CGRectMake(0, (result.height/2 - 40), result.width, 40);
        [_emptyView addSubview:button];
        [self.view addSubview:_emptyView];
        return;
    }
    NSString *stringCost = [NSString stringWithFormat:@"$ %@", [_oeuvre.artworks[0] cost]];
    _artworkTitle.text = [_oeuvre.artworks[0] title];
    _artworkDetail.text = [_oeuvre.artworks[0] detail];
    _artworkCost.text = stringCost;
    _artworkPhoto.image = [UIImage imageWithContentsOfFile:[NSString stringWithFormat:@"%@/%@",_prefixFile, [_oeuvre.artworks[0] file]]];
    
    _indexValue = 0;
}

- (IBAction)sendEmail:(UIButton *)sender
{
    NSString *messageBody = [NSString stringWithFormat:@"I would like to purchase %@.",[_oeuvre.artworks[_indexValue] title]];
    NSString *messageSubject = [NSString stringWithFormat:@"LearnToPaint_Purchase_%@", [_oeuvre.artworks[_indexValue] title]];
    MFMailComposeViewController *composer=[[MFMailComposeViewController alloc]init];
    composer.mailComposeDelegate = (id)self;
    if ([MFMailComposeViewController canSendMail]) {
        [composer setToRecipients:[NSArray arrayWithObjects:@"Kristen@KristenCaubleMorse.com", nil]];
        [composer setSubject:messageSubject];
        [composer setMessageBody:messageBody isHTML:NO];
        [composer addAttachmentData:[NSData dataWithContentsOfFile:[_prefixFile stringByAppendingPathComponent:[_oeuvre.artworks[_indexValue] file]]] mimeType:@"image/jpg" fileName:[_oeuvre.artworks[_indexValue] file]];
        [composer setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
        [self presentViewController:composer animated:YES completion:nil];
    }
    else {
    }
}

- (IBAction)updateFiles:(UIButton *)sender
{
    [_emptyView removeFromSuperview];
    [_mainDownloader getLocalFileFromURLString:@"Oeuvre.xml"];
    _downloadView.hidden = false;
    
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return _oeuvre.artworks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int row = [indexPath row];
    static NSString *CellIdentifier = @"Cell";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [_oeuvre.artworks[row] title];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"$ %@", [_oeuvre.artworks[row] cost]];
    [cell setBackgroundColor:[UIColor darkTextColor]];
    
    
    return cell;
}




#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_mainTable deselectRowAtIndexPath:indexPath animated:YES];
    
    
    Artwork *artwork = _oeuvre.artworks[indexPath.row];
    
    
    _indexValue = [indexPath row];
    
    
    _artworkTitle.text = artwork.title;
    _artworkDetail.text = artwork.detail;
    _artworkCost.text = [NSString stringWithFormat:@"$ %@", artwork.cost];
    [_artworkPhoto setImageWithURL:artwork.imageURL];
    
}

#pragma mark - Download Delegate Methods

- (void)fileDidLoad:(NSString *)filePath
{
    
    
    if ([filePath.pathExtension isEqualToString: @"xml"])
    {
        _oeuvre = [ArtworkParser loadOeuvre:filePath];
        
        
        _downloadIndex = 0;
        if ([[NSFileManager defaultManager] fileExistsAtPath:[_prefixFile stringByAppendingPathComponent:[_oeuvre.artworks[0] file]]])
        {
            
        }else{
            _downloadView.labelText = @"Downloading Data";
            _downloadView.userInteractionEnabled = false;
            [_downloadView show:YES];
            [_mainDownloader getLocalFileFromURLString:[_oeuvre.artworks[0] file]];
        }
        
        _downloadIndex++;
        [self loadUI];
        [_mainTable reloadData];
    }
    if ([filePath.pathExtension isEqualToString:@"jpg"])
    {
        if ([_oeuvre.artworks objectAtIndex:_downloadIndex] != nil)
        {
            if ([[NSFileManager defaultManager] fileExistsAtPath:[_prefixFile stringByAppendingPathComponent:[_oeuvre.artworks[_downloadIndex] file]]])
            {
                [_downloadView hide:YES];
               
            }else{
                [_mainDownloader getLocalFileFromURLString:[_oeuvre.artworks[_downloadIndex] file]];
            }
            
            _downloadIndex++;
            [self loadUI];
            [_mainTable reloadData];
        }
    }
    
    
    
}

- (void)updateDownload:(int)bytes outOf:(int)totalBytes
{
    // NSLog(@"Downloaded: %d out of %d", bytes, totalBytes);
}

@end
