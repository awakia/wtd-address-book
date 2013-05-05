//
//  Created by Kenzan Hase
//  Copyright (c) Kenzan Hase. All rights reserved.
//


#import "AppDelegate.h"
// アプリ開始時、チュートリアル画面
#import "TutorialNavigationController.h"


#pragma mark - implementation
@implementation AppDelegate


#pragma mark - lifecycle
- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // UI設定
    BOOL isTutorial = YES;
    UIViewController *vc = nil;
    if (isTutorial) { vc = [[TutorialNavigationController alloc] init]; }// アプリ開始チュートリアル
    else { }
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    [self.window setRootViewController:vc];

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


@end
