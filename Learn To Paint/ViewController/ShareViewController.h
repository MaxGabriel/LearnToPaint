//
//  ShareViewController.h
//  Learn To Paint
//
//  Created by Jack Murdock on 10/15/13.
//  Copyright (c) 2013 Jack Murdock. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface ShareViewController : UIViewController
<UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *postImage;
@property (strong, nonatomic) IBOutlet UITextView *postText;
@property (strong, nonatomic) IBOutlet UIButton *pickButton;
@property (strong, nonatomic) IBOutlet UIButton *shareButton;
@property (strong, nonatomic) IBOutlet UIButton *takeButton;

- (IBAction)selectImage:(UIButton *)sender;
- (IBAction)takePhoto:(UIButton *)sender;
- (IBAction)postMessage:(UIButton *)sender;
@end


