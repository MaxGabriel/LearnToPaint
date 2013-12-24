//
//  DetailsViewController.h
//  Learn To Paint
//
//  Created by Jack Murdock on 10/14/13.
//  Copyright (c) 2013 Jack Murdock. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface DetailsViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *detailImage;
@property (strong, nonatomic) IBOutlet UITextView *detailDescription;
@property (strong, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (strong, nonatomic) IBOutlet UIButton *shareCreation;
@property (strong, nonatomic) IBOutlet UIView *movieRECT;

@property (nonatomic)int row;
@property(strong, nonatomic) MPMoviePlayerController *moviePlayer;

@end
