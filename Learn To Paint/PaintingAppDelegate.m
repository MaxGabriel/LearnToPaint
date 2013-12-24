//
//  PaintingAppDelegate.m
//  Learn To Paint
//
//  Created by Jack Murdock on 10/8/13.
//  Copyright (c) 2013 Jack Murdock. All rights reserved.
//

#import "PaintingAppDelegate.h"
#import "PaintingIAPHelper.h"
#import "iRate.h"
#import "SharedData.h"

@implementation PaintingAppDelegate

+ (void)initialize
{
    //set the bundle ID. normally you wouldn't need to do this
    //as it is picked up automatically from your Info.plist file
    //but we want to test with an app that's actually on the store
    [iRate sharedInstance].applicationBundleID = @"com.jackcreeksoftware.LearnToPaint";
	[iRate sharedInstance].onlyPromptIfLatestVersion = NO;
    [iRate sharedInstance].remindPeriod = 0;
    [iRate sharedInstance].daysUntilPrompt = 0;
    [iRate sharedInstance].usesCount = 0;
    [iRate sharedInstance].remindButtonLabel = @"";
    //enable preview mode
    //[iRate sharedInstance].previewMode = YES;
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    
    if ([[UIScreen mainScreen] bounds].size.height == 480)
    {
        UIStoryboard *smallStoryBoard = [UIStoryboard storyboardWithName:@"iPhoneShort" bundle:nil];
        UIViewController *initialViewController = [smallStoryBoard instantiateInitialViewController];
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.window.rootViewController = initialViewController;
        [self.window makeKeyAndVisible];
    }
    
    [PaintingIAPHelper sharedInstance];
    
    // Custimization for the entire App
    
    [[UITabBar appearance] setTintColor:[UIColor clearColor]];
    [[UINavigationBar appearance] setTintColor:[UIColor clearColor]];
    //[SharedData sharedOeuvre];

   
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
