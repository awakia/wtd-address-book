//  Created by Kenzan Hase
//  Copyright (c) Kenzan Hase. All rights reserved.


#import "WelcomeViewController.h"
#import <FacebookSDK/FacebookSDK.h>


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
    if (FBSession.activeSession.isOpen) {
        [self performSegueWithIdentifier:@"pushSyncContactViewController"
                                  sender:self];
    }
    else {
        [FBSession openActiveSessionWithReadPermissions:nil
                                           allowLoginUI:YES
                                      completionHandler:^ (FBSession *session,
                                                           FBSessionState state,
                                                           NSError *error) {
            if (error) {
                //error.localizedDescription
            }
            else if (session.isOpen) {
                [self performSegueWithIdentifier:@"pushSyncContactViewController"
                                          sender:self];
            }
        }];
        return;
    }
}

- (IBAction)touchedUpInsideWithPushViewControllerButton:(UIButton *)pushViewControllerButton
{
}


@end
