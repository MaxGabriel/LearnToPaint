//
//  ShareViewController.m
//  Learn To Paint
//
//  Created by Jack Murdock on 10/15/13.
//  Copyright (c) 2013 Jack Murdock. All rights reserved.
//

#import "ShareViewController.h"

@interface ShareViewController ()
@property (nonatomic) BOOL editing;
@end

@implementation ShareViewController

#define kOFFSET_FOR_KEYBOARD 100.0

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
    _postText.delegate = self;
    [self viewWillAppear:NO];
	// Do any additional setup after loading the view.
    // Gesture to go back a View
    UIGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    [self.view addGestureRecognizer:swipeGesture];
    
    // Gesture to take a picture
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    tapGesture.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:tapGesture];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    
    // So the view is show up correctly if device rotated
     float duration = .2;
    if([[UIDevice currentDevice] orientation] == UIInterfaceOrientationLandscapeLeft || [[UIDevice currentDevice] orientation] == UIInterfaceOrientationLandscapeRight)
    {
       
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 480)
        {
            //iphone small
            [UIView animateWithDuration:duration animations:^(void){
                _postImage.frame = CGRectMake(0, 0, 140, 140);
                _postText.frame = CGRectMake(150, 0, 330, 108);
                _pickButton.frame = CGRectMake(21, 148, 131, 44);
                _shareButton.frame = CGRectMake(167, 148, 146, 44);
                _takeButton.frame = CGRectMake(329, 148, 131, 44);
            }];
            [UIView commitAnimations];
        } else if(result.height == 568)
        {
            //iphone 5
            [UIView animateWithDuration:duration animations:^(void){
                _postImage.frame = CGRectMake(0, 0, 179, 157);
                _postText.frame = CGRectMake(187, 0, 381, 108);
                _pickButton.frame = CGRectMake(0, 164, 101, 44);
                _shareButton.frame = CGRectMake(211, 164, 146, 44);
                _takeButton.frame = CGRectMake(436, 164, 132, 44);
            }];
            [UIView commitAnimations];
            
            
            
        } else {
            //ipad
            [UIView animateWithDuration:duration animations:^(void){
                _postImage.frame = CGRectMake(20, 20, 984, 300);
                _postText.frame = CGRectMake(20, 329, 984, 223);
                _pickButton.frame = CGRectMake(204, 560, 102, 44);
                _shareButton.frame = CGRectMake(463, 595, 99, 41);
                _takeButton.frame = CGRectMake(716, 560, 105, 44);
            }];
            [UIView commitAnimations];
        }
    }else{
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 480)
        {
            //iphone small
            
            [UIView animateWithDuration:duration animations:^(void){
                _postImage.frame = CGRectMake(20, 20, 280, 115);
                _postText.frame = CGRectMake(20, 146, 280, 119);
                _pickButton.frame = CGRectMake(20, 273, 101, 44);
                _shareButton.frame = CGRectMake(92, 324, 146, 44);
                _takeButton.frame = CGRectMake(174, 273, 131, 44);
            }];
            [UIView commitAnimations];
            
        } else if(result.height == 568)
        {
            //iphone 5
            
            [UIView animateWithDuration:duration animations:^(void){
                _postImage.frame = CGRectMake(20, 20, 280, 201);
                _postText.frame = CGRectMake(20, 229, 280, 119);
                _pickButton.frame = CGRectMake(20, 356, 101, 44);
                _shareButton.frame = CGRectMake(92, 412, 146, 44);
                _takeButton.frame = CGRectMake(179, 356, 131, 44);
            }];
            [UIView commitAnimations];
            
            
            
        } else {
            //ipad
            [UIView animateWithDuration:duration animations:^(void){
                _postImage.frame = CGRectMake(20, 20, 728, 300);
                _postText.frame = CGRectMake(20, 339, 728, 306);
                _pickButton.frame = CGRectMake(104, 765, 102, 44);
                _shareButton.frame = CGRectMake(335, 851, 99, 41);
                _takeButton.frame = CGRectMake(560, 765, 105, 44);
            }];
            [UIView commitAnimations];
        }
    }
}
-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    //change view to be viewed correctly on rotated device
    if(toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
    {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 480)
        {
            
            //iphone small
            [UIView animateWithDuration:duration animations:^(void){
                _postImage.frame = CGRectMake(0, 0, 140, 140);
                _postText.frame = CGRectMake(150, 0, 330, 108);
                _pickButton.frame = CGRectMake(21, 148, 131, 44);
                _shareButton.frame = CGRectMake(167, 148, 146, 44);
                _takeButton.frame = CGRectMake(329, 148, 131, 44);
            }];
            [UIView commitAnimations];
        } else if(result.height == 568)
        {
            
            //iphone 5
            [UIView animateWithDuration:duration animations:^(void){
                _postImage.frame = CGRectMake(0, 0, 179, 157);
                _postText.frame = CGRectMake(187, 0, 381, 108);
                _pickButton.frame = CGRectMake(0, 164, 101, 44);
                _shareButton.frame = CGRectMake(211, 164, 146, 44);
                _takeButton.frame = CGRectMake(436, 164, 132, 44);
            }];
            [UIView commitAnimations];
            
            
            
        } else {
            //ipad
            [UIView animateWithDuration:duration animations:^(void){
                _postImage.frame = CGRectMake(20, 20, 984, 300);
                _postText.frame = CGRectMake(20, 329, 984, 223);
                _pickButton.frame = CGRectMake(204, 560, 102, 44);
                _shareButton.frame = CGRectMake(463, 595, 99, 41);
                _takeButton.frame = CGRectMake(716, 560, 105, 44);
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
                _postImage.frame = CGRectMake(20, 20, 280, 115);
                _postText.frame = CGRectMake(20, 146, 280, 119);
                _pickButton.frame = CGRectMake(20, 273, 101, 44);
                _shareButton.frame = CGRectMake(92, 324, 146, 44);
                _takeButton.frame = CGRectMake(174, 273, 131, 44);
            }];
            [UIView commitAnimations];
            
        } else if(result.height == 568)
        {
            //iphone 5
            
            [UIView animateWithDuration:duration animations:^(void){
                _postImage.frame = CGRectMake(20, 20, 280, 201);
                _postText.frame = CGRectMake(20, 229, 280, 119);
                _pickButton.frame = CGRectMake(20, 356, 101, 44);
                _shareButton.frame = CGRectMake(92, 412, 146, 44);
                _takeButton.frame = CGRectMake(179, 356, 131, 44);
            }];
            [UIView commitAnimations];
            
            
            
        } else {
            //ipad
            [UIView animateWithDuration:duration animations:^(void){
                _postImage.frame = CGRectMake(20, 20, 728, 300);
                _postText.frame = CGRectMake(20, 339, 728, 306);
                _pickButton.frame = CGRectMake(104, 765, 102, 44);
                _shareButton.frame = CGRectMake(335, 851, 99, 41);
                _takeButton.frame = CGRectMake(560, 765, 105, 44);
            }];
            [UIView commitAnimations];
        }
    }
}

-(IBAction)handleSwipe:(UISwipeGestureRecognizer *)sender
{
    // go to previous view controller
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)handleTap:(UITapGestureRecognizer *)sender
{
    // to take a photo
    [self photo];
    
}
// Maybe for so the keyboard moves correctly
//-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
//
//{
//    if(fromInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || fromInterfaceOrientation == UIInterfaceOrientationLandscapeRight)
//    {
//        
//        CGSize result = [[UIScreen mainScreen] bounds].size;
//        if(result.height == 480)
//        {
//            //iphone small
//            if (_editing == false)
//            {
//                CGRect rect = self.view.frame;
//                
//                // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
//                // 2. increase the size of the view so that the area behind the keyboard is covered up.
//                rect.origin.y -= kOFFSET_FOR_KEYBOARD;
//                rect.size.height += kOFFSET_FOR_KEYBOARD;
//                [self.view addSubview:_postText];
//            }
//        } else if(result.height == 568)
//        {
//            //iphone 5
//            if (_editing == false)
//            {
//                CGRect rect = self.view.frame;
//                
//                // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
//                // 2. increase the size of the view so that the area behind the keyboard is covered up.
//                rect.origin.y -= kOFFSET_FOR_KEYBOARD;
//                rect.size.height += kOFFSET_FOR_KEYBOARD;
//                [self.view addSubview:_postText];
//            }
//        } else {
//            //ipad
//            
//        }
//        
//    } else if (fromInterfaceOrientation == UIInterfaceOrientationPortrait)
//    {
//        CGSize result = [[UIScreen mainScreen] bounds].size;
//        if(result.height == 480)
//        {
//            if (_editing == false)
//            {
//                CGRect rect = self.view.frame;
//                // revert back to the normal state.
//                rect.origin.y += kOFFSET_FOR_KEYBOARD;
//                rect.size.height -= kOFFSET_FOR_KEYBOARD;
//                [self.view addSubview:_postText];
//            }
//            
//            //iphone small
//            
//        } else if(result.height == 568)
//        {
//            if (_editing == false)
//            {
//                CGRect rect = self.view.frame;
//                // revert back to the normal state.
//                rect.origin.y += kOFFSET_FOR_KEYBOARD;
//                rect.size.height -= kOFFSET_FOR_KEYBOARD;
//                [self.view addSubview:_postText];
//            }
//            //iphone 5
//        } else {
//            //ipad
//        }
//    }
//}


- (IBAction)selectImage:(UIButton *)sender
{
    
    // get access to saved photos and to pick a photo
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeSavedPhotosAlbum])
    {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType =
        UIImagePickerControllerSourceTypePhotoLibrary;
        imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
        imagePicker.allowsEditing = NO;
        [self presentViewController:imagePicker animated:YES completion:nil];
    }
    
}

#pragma mark UIImagePickerControllerDelegate

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // for the user to pick a photo
    NSString *mediaType = info[UIImagePickerControllerMediaType];
    [self dismissViewControllerAnimated:YES completion:nil];
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage])
    {
        UIImage *image = info[UIImagePickerControllerOriginalImage];
        
        _postImage.image = image;
    }
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    // Need by apple documentation
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)takePhoto:(UIButton *)sender
{
    [self photo];
}
-(void)photo
{
    
    // Take a photo APPLE Code
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
        imagePicker.allowsEditing = NO;
        [self presentViewController:imagePicker animated:YES completion:nil];
        
    }
}

- (IBAction)postMessage:(UIButton *)sender
{
    
    
    NSArray *activityItems;
    // DO we have both image and text or just text
    if (_postImage.image != nil)
    {
        activityItems = @[_postText.text, _postImage.image];
    } else {
        activityItems = @[_postText.text];
    }
    // send it out using social media
    UIActivityViewController *activityController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    
    [self presentViewController:activityController
                       animated:YES completion:nil];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    // moving view keyboard for visablilty
    UITouch *touch = [[event allTouches] anyObject];
    
    if ([_postText isFirstResponder] && [touch view] !=_postText) {
        [_postText resignFirstResponder];
        [_postText endEditing:YES];
    }
    [super touchesBegan:touches withEvent:event];
}
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    // Animate the current view out of the way
    _editing = true;
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
    
}

-(void)textViewDidEndEditing:(UITextView *)textView
{
    //for keyboard moving view
    _editing = false;
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}



-(void)setViewMovedUp:(BOOL)movedUp
{
    if ([[UIDevice currentDevice] orientation] == UIInterfaceOrientationLandscapeLeft || [[UIDevice currentDevice] orientation] == UIInterfaceOrientationLandscapeRight)
    {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.height == 480)
        {
            //iphone small
            return;
        } else if(result.height == 568)
        {
            //iphone 5
            return;
        } else {
            //ipad
           
            
        }
    }
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    
    CGRect rect = self.view.frame;

    if (movedUp)
    {
        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
        // 2. increase the size of the view so that the area behind the keyboard is covered up.
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
        rect.size.height += kOFFSET_FOR_KEYBOARD;
        [self.view addSubview:_postText.viewForBaselineLayout];
    }
    else
    {
        // revert back to the normal state.
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
        rect.size.height -= kOFFSET_FOR_KEYBOARD;
        [self.view addSubview:_postText.viewForBaselineLayout];
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}
@end


