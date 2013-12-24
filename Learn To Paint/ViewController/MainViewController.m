//
//  MainViewController.m
//  Learn To Paint
//
//  Created by Jack Murdock on 10/8/13.
//  Copyright (c) 2013 Jack Murdock. All rights reserved.
//

#import "MainViewController.h"
#import "LessonObject.h"
#import "SharedData.h"


@interface MainViewController ()

@end

@implementation MainViewController

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
    
    
    
    // _mainScrollView.contentSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height *1.1);
    _photoView.animationImages = [[NSArray alloc] initWithObjects: [UIImage imageNamed:@"italyLandscape.jpg" ],
                                  [UIImage imageNamed:@"mt.etna-sicily.jpg"],
                                  [UIImage imageNamed:@"oldtownincaserta.jpg"],
                                  [UIImage imageNamed:@"poppies.jpg"], nil];
    [_loadingText startAnimating];
    _loadingText.hidesWhenStopped = true;
    [self.view addSubview:_loadingText];  //Keep it to the text view
    //    if ([[UIScreen mainScreen] bounds].size.height == 568)
    //    {
    //        _mainScrollView.scrollEnabled = false;
    //
    //    } else {
    //
    //        _mainScrollView.scrollEnabled = true;
    //    }
    [self updateUI];
    
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    CGSize result = [[UIScreen mainScreen] bounds].size;
    if(result.height == 480)
    {
        //iphone small
        if (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight || toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
            _photoView.hidden = true;
        }
        if (toInterfaceOrientation == UIInterfaceOrientationPortrait)
        {
            _photoView.hidden = false;
        }
        
    } else if(result.height == 568)
    {
        //iphone 5
        if (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight || toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
            _photoView.hidden = true;
        }
        if (toInterfaceOrientation == UIInterfaceOrientationPortrait)
        {
            _photoView.hidden = false;
        }
    } else {
        //ipad
        
    }
}



-(void)updateUI
{
    [self rotatePictures];
    [self loadText];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)rotatePictures
{
    _photoView.animationDuration = 25;
    _photoView.animationRepeatCount = 0;
    
    [self.view addSubview:_photoView];
    [_photoView startAnimating];
    
    
}

-(void)loadText
{
    
    // set sumthing
    _webText.delegate = (id)self;
    NSString *fullURL = @"http://jackcreeksoftware.com/wp-includes/Annoncement.html";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_webText loadRequest:requestObj];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSString *webText = [webView stringByEvaluatingJavaScriptFromString:@"document.body.innerText"];
    _annoncementText.text = [NSString stringWithFormat:@"Annoncements: \n%@", webText];
    [_loadingText stopAnimating];
}

-(void) viewWillAppear:(BOOL)animated
{
    if ([[UIDevice currentDevice] orientation] == UIInterfaceOrientationPortrait)
    {
        _photoView.hidden = false;
    }else if([[UIDevice currentDevice] orientation] == UIInterfaceOrientationLandscapeLeft || [[UIDevice currentDevice] orientation] == UIInterfaceOrientationLandscapeRight)
    {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height <= 480)
        {
            _photoView.hidden = true;
            
        }

    }

    
}


@end
