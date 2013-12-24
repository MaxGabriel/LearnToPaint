//
//  MainViewController.h
//  Learn To Paint
//
//  Created by Jack Murdock on 10/8/13.
//  Copyright (c) 2013 Jack Murdock. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MainViewController : UIViewController



@property (strong, nonatomic) IBOutlet UITextView *annoncementText;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *loadingText;
@property (strong, nonatomic) IBOutlet UIImageView *photoView;
@property (strong, nonatomic) IBOutlet UIWebView *webText;

@property(strong,nonatomic)NSArray *photos;

@end
