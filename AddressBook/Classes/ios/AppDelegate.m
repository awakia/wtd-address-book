//
//  Created by Kenzan Hase
//  Copyright (c) Kenzan Hase. All rights reserved.
//


#import "AppDelegate.h"


#pragma mark - implementation
@implementation AppDelegate


#pragma mark - lifecycle
- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // UI設定
    BOOL isTutorial = YES;
    UIViewController *rootVc = nil;
        // アプリ開始チュートリアル
    if (isTutorial) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:kTutorialStoryboard
                                                             bundle:nil];
        rootVc = [storyboard instantiateInitialViewController];
    }
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:rootVc];
    [self.window setRootViewController:nvc];

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
