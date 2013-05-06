//  Created by Kenzan Hase
//  Copyright (c) Kenzan Hase. All rights reserved.


#import "WelcomeViewController.h"


#pragma mark - implementation
@implementation WelcomeViewController


#pragma mark - synthesize


#pragma mark - initializer
- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super initWithCoder:decoder];
    if (self) {
    }
    return self;
}


#pragma mark - lifecycle
- (void)loadView
{
    [super loadView];
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}


#pragma mark - event listener
- (IBAction)touchedUpInsideWithLoginButton:(UIButton *)loginButton
{
/*
    LoginViewController *vc = [[LoginViewController alloc] initWithNibName:NSStringFromClass([LoginViewController class])
                                                                    bundle:nil];
    [vc showInView:self.view
        loginIsSucceededBlock:^ () {
    }
           loginIsFailedBlock:^ () {}
         loginIsCanceledBlock:^ () {}];
*/
}

- (IBAction)touchedUpInsideWithPushViewControllerButton:(UIButton *)pushViewControllerButton
{
}


#pragma mark - OauthXSessionDelegate
///**
// * Called when the user successfully logged in
// * or when the access token was validated.
// */
//- (void) oauthXDidLoginToService:(NSString *)service
//{
//}
//
///**
// * Called when the user dismissed the dialog without logging in.
// * or when the access token was not validated.
// */
//- (void) oauthXDidNotLoginToService:(NSString *)service userCanceled:(BOOL)cancelled
//{
//}
//
///**
// * Called when the user logged out.
// */
//- (void) oauthXDidLogoutFromService:(NSString *)service{
//
//}
//
///**
// * Called when the user successfully logged in
// * or when the access token was validated.
// */
//- (void) oauthXWillLoginWithURL:(NSURL *)loginURL{
//}


@end
