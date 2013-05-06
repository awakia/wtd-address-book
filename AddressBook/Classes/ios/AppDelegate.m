//
//  Created by Kenzan Hase
//  Copyright (c) Kenzan Hase. All rights reserved.
//


#import "AppDelegate.h"
#import "TutorialNavigationController.h"    // アプリ開始時、チュートリアル画面
#import "RootViewController.h"              // アプリのルートUI


#pragma mark - implementation
@implementation AppDelegate


#pragma mark - lifecycle
- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    BOOL isTutorial = YES;
    // アプリ開始チュートリアル or 通常
    UIViewController *vc = (isTutorial) ? [[TutorialNavigationController alloc] init] : [[RootViewController alloc] init];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    [self.window setRootViewController:vc];

    // チュートリアル終了通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(tutorialDidFinishedWithNotification:)
                                                 name:kNotificationTutorialDidFinished
                                               object:nil];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}


#pragma mark - Notification
/**
 * チュートリアルが終了した
 * @param notification notification
 */
- (void)tutorialDidFinishedWithNotification:(NSNotification *)notification
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:kRootViewStoryboard
                                                         bundle:nil];
    UIViewController *vc = [storyboard instantiateInitialViewController];
    [self.window setRootViewController:vc];
}


@end
