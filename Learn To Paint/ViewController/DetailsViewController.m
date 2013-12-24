//
//  DetailsViewController.m
//  Learn To Paint
//
//  Created by Jack Murdock on 10/14/13.
//  Copyright (c) 2013 Jack Murdock. All rights reserved.
//

#import "DetailsViewController.h"
#import "SharedData.h"
#import "LessonObject.h"

@interface DetailsViewController ()
@property (nonatomic)BOOL isPurchased;
@end

@implementation DetailsViewController


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
    _isPurchased =[[NSUserDefaults standardUserDefaults]boolForKey:[[SharedData sharedData][_row] identifierOfLesson]];
    
	// Do any additional setup after loading the view.
    [self updateUI];
    
    
    UIGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    [self.view addGestureRecognizer:swipeGesture];
}



-(void)viewWillAppear:(BOOL)animated
{
    //Check orientation
    float duration = .2;
    if([[UIDevice currentDevice] orientation] == UIInterfaceOrientationLandscapeLeft || [[UIDevice currentDevice] orientation] == UIInterfaceOrientationLandscapeRight)
    {
        
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 480)
        {
            //iphone small
            [UIView animateWithDuration:duration animations:^(void){
                _detailDescription.frame = CGRectMake(0, 110, 140, 105);
                _detailImage.frame = CGRectMake(0, 0, 140, 105);
                _shareCreation.frame = CGRectMake(286, 175, 131, 33);
                _movieRECT.frame = CGRectMake(140, 0, 330, 170);
                _moviePlayer.view.frame = CGRectMake(140, 0, 330, 170);
            }];
            [UIView commitAnimations];
        } else if(result.height == 568)
        {
            //iphone 5
            [UIView animateWithDuration:duration animations:^(void){
                _detailDescription.frame = CGRectMake(0, 110, 140, 105);
                _detailImage.frame = CGRectMake(0, 0, 140, 105);
                _shareCreation.frame = CGRectMake(286, 175, 131, 33);
                _movieRECT.frame = CGRectMake(140, 0, 420, 170);
                _moviePlayer.view.frame = CGRectMake(140, 0, 420, 170);
            }];
            [UIView commitAnimations];
            
            
            
        } else {
            //ipad
            [UIView animateWithDuration:duration animations:^(void){
                _detailDescription.frame = CGRectMake(32, 357, 244, 278);
                _detailImage.frame = CGRectMake(32, 20, 244, 278);
                _shareCreation.frame = CGRectMake(557, 592, 174, 44);
                _movieRECT.frame = CGRectMake(284, 20, 720, 480);
                _moviePlayer.view.frame = CGRectMake(284, 20, 720, 480);
            }];
            [UIView commitAnimations];
        }
    } else //if ([[UIDevice currentDevice] orientation] == UIInterfaceOrientationPortrait)
    {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 480)
        {
            //iphone small
            [UIView animateWithDuration:duration animations:^(void){
                _detailDescription.frame = CGRectMake(160, 0, 160, 100);
                _detailImage.frame = CGRectMake(0, 0, 160, 100);
                _shareCreation.frame = CGRectMake(95, 324, 131, 44);
                _movieRECT.frame = CGRectMake(0, 122, 320, 184);
                _moviePlayer.view.frame = CGRectMake(0, 122, 320, 184);
            }];
            [UIView commitAnimations];
            
        } else if(result.height == 568)
        {
            //iphone 5
            [UIView animateWithDuration:duration animations:^(void){
                _detailDescription.frame = CGRectMake(160, 0, 160, 140);
                _detailImage.frame = CGRectMake(0, 0, 160, 140);
                _shareCreation.frame = CGRectMake(95, 412, 131, 44);
                _movieRECT.frame = CGRectMake(0, 177, 320, 184);
                _moviePlayer.view.frame = CGRectMake(0, 177, 320, 184);
            }];
            [UIView commitAnimations];
            
            
            
        } else {
            //ipad
            [UIView animateWithDuration:duration animations:^(void){
                _detailDescription.frame = CGRectMake(394, 20, 350, 230);
                _detailImage.frame = CGRectMake(24, 20, 230, 230);
                _shareCreation.frame = CGRectMake(258, 20, 131, 44);
                _movieRECT.frame = CGRectMake(24, 359, 720, 480);
                _moviePlayer.view.frame = CGRectMake(24, 359, 720, 480);
            }];
            [UIView commitAnimations];
        }
    }
    
}

-(IBAction)handleSwipe:(UISwipeGestureRecognizer *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if(toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
    {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 480)
        {
            //iphone small
            [UIView animateWithDuration:duration animations:^(void){
                _detailDescription.frame = CGRectMake(0, 110, 140, 105);
                _detailImage.frame = CGRectMake(0, 0, 140, 105);
                _shareCreation.frame = CGRectMake(286, 175, 131, 33);
                _movieRECT.frame = CGRectMake(140, 0, 330, 170);
                _moviePlayer.view.frame = CGRectMake(140, 0, 330, 170);
            }];
            [UIView commitAnimations];
        } else if(result.height == 568)
        {
            //iphone 5
            [UIView animateWithDuration:duration animations:^(void){
                _detailDescription.frame = CGRectMake(0, 110, 140, 105);
                _detailImage.frame = CGRectMake(0, 0, 140, 105);
                _shareCreation.frame = CGRectMake(286, 175, 131, 33);
                _movieRECT.frame = CGRectMake(140, 0, 420, 170);
                _moviePlayer.view.frame = CGRectMake(140, 0, 420, 170);
            }];
            [UIView commitAnimations];
            
            
            
        } else {
            //ipad
            [UIView animateWithDuration:duration animations:^(void){
                _detailDescription.frame = CGRectMake(32, 357, 244, 278);
                _detailImage.frame = CGRectMake(32, 20, 244, 278);
                _shareCreation.frame = CGRectMake(557, 592, 174, 44);
                _movieRECT.frame = CGRectMake(284, 20, 720, 480);
                _moviePlayer.view.frame = CGRectMake(284, 20, 720, 480);
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
                _detailDescription.frame = CGRectMake(160, 0, 160, 100);
                _detailImage.frame = CGRectMake(0, 0, 160, 100);
                _shareCreation.frame = CGRectMake(95, 324, 131, 44);
                _movieRECT.frame = CGRectMake(0, 122, 320, 184);
                _moviePlayer.view.frame = CGRectMake(0, 122, 320, 184);
            }];
            [UIView commitAnimations];
            
        } else if(result.height == 568)
        {
            //iphone 5
            [UIView animateWithDuration:duration animations:^(void){
                _detailDescription.frame = CGRectMake(160, 0, 160, 140);
                _detailImage.frame = CGRectMake(0, 0, 160, 140);
                _shareCreation.frame = CGRectMake(95, 412, 131, 44);
                _movieRECT.frame = CGRectMake(0, 177, 320, 184);
                _moviePlayer.view.frame = CGRectMake(0, 177, 320, 184);
            }];
            [UIView commitAnimations];
            
            
            
        } else {
            //ipad
            [UIView animateWithDuration:duration animations:^(void){
                _detailDescription.frame = CGRectMake(394, 20, 350, 230);
                _detailImage.frame = CGRectMake(24, 20, 230, 230);
                _shareCreation.frame = CGRectMake(258, 20, 131, 44);
                _movieRECT.frame = CGRectMake(24, 359, 720, 480);
                _moviePlayer.view.frame = CGRectMake(24, 359, 720, 480);
            }];
            [UIView commitAnimations];
        }
    }
}


-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    if (fromInterfaceOrientation == UIInterfaceOrientationPortrait)
    {
        if (_isPurchased == true)
        {
            if (_moviePlayer != nil)
            {
                [_moviePlayer setFullscreen:YES animated:NO];
                return;
            }
        }
    }
    
    
    //[self updateUI];
}

-(void)updateUI
{
    
    self.title = [[SharedData sharedData][_row] titleOfLesson];
    _detailDescription.text = [[SharedData sharedData][_row] descriptionOfLesson];
    _detailImage.image = [UIImage imageNamed:[[SharedData sharedData][_row] imageOfLesson]];
    
    [self.navigationController setNavigationBarHidden:NO];
    
    _mainScrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height * 0.8);
    
    [_mainScrollView addSubview:_detailDescription];
    [_mainScrollView addSubview:_detailImage];
    [self setUpMovie];
    
    
}


-(void)setUpMovie
{
    if (_isPurchased == false && ![[[SharedData sharedData][_row] identifierOfLesson] isEqualToString:@""])
    {
        
        _shareCreation.hidden = true;
        UITextView *downloadMovie = [[UITextView alloc]initWithFrame: CGRectMake(0, 0, 300, 100)];
        downloadMovie.text = @"Go to the Store to Purchase.";
        downloadMovie.textColor = [UIColor whiteColor];
        downloadMovie.font = [UIFont systemFontOfSize:25];
        downloadMovie.editable = false;
        downloadMovie.scrollEnabled = false;
        downloadMovie.backgroundColor = [UIColor blackColor];
        [_movieRECT addSubview:downloadMovie];
        return;
    }
    [self moviePlayerController];
    
    // Customization
    _moviePlayer.view.frame = _movieRECT.frame;
    
    if (![[UIScreen mainScreen] bounds].size.height == 568)
    {
        _mainScrollView.scrollEnabled = true;
    }
    
    _moviePlayer.controlStyle = MPMovieControlStyleDefault;
    _moviePlayer.shouldAutoplay = NO;
    _moviePlayer.backgroundView.backgroundColor = [UIColor blackColor];
    _moviePlayer.allowsAirPlay = YES;
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayBackDidFinish:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:_moviePlayer];
    //[_mainScrollView addSubview: _moviePlayer.view];
    [self.view addSubview:_moviePlayer.view];
    [_moviePlayer prepareToPlay];
    //[_moviePlayer setFullscreen:YES animated:YES];
}

#pragma Movie Player Controller Methods
-(MPMoviePlayerController *)moviePlayerController
{
    
    NSURL *url = [NSURL URLWithString:[[SharedData sharedData][_row] movieURLOfLesson]];
    _moviePlayer =  [[MPMoviePlayerController alloc] initWithContentURL:url];
    //    if (_moviePlayer == nil && !(_lesson.isPurchased == false))
    //    {
    //
    //        NSBundle *bundle = [NSBundle mainBundle];
    //
    //        NSString *moviePath = [bundle pathForResource:_lesson.lessonMovie ofType:@"MOV"];
    //        if (moviePath == nil)
    //        {
    //            NSString *path = [NSString stringWithFormat:@"%@.MOV",_lesson.lessonMovie];
    //            NSArray *searchPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //            NSString *documentPath = [searchPaths lastObject];
    //
    //            moviePath = [documentPath stringByAppendingPathComponent:path];
    //
    //
    //        }
    //
    //        NSURL *movieURL = [NSURL fileURLWithPath:moviePath] ;
    //
    //        _moviePlayer =  [[MPMoviePlayerController alloc] initWithContentURL:movieURL];
    //
    //
    //    }
    return _moviePlayer;
}

- (void) moviePlayBackDidFinish:(NSNotification*)notification
{
    MPMoviePlayerController *player = [notification object];
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:MPMoviePlayerPlaybackDidFinishNotification
     object:player];
    
    if ([player respondsToSelector:@selector(setFullscreen:animated:)])
    {
        //[player.view removeFromSuperview];
    }
}


@end
