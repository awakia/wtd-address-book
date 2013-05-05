//  Created by Kenzan Hase
//  Copyright (c) Kenzan Hase. All rights reserved.


#import "WelcomeViewController.h"


#pragma mark - implementation
@implementation WelcomeViewController


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
    [self.navigationController.navigationBar setHidden:NO];
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


@end
