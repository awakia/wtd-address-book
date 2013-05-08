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
/*
    // Facebook FriendPicker
    FBFriendPickerViewController *vc = [[FBFriendPickerViewController alloc] init];
    vc.title = @"Pick Friends";
    vc.delegate = self;
    [vc loadData];
    [vc clearSelection];
    [self presentViewController:vc
                       animated:YES
                     completion:nil];
*/
}

- (IBAction)touchedUpInsideWithPushViewControllerButton:(UIButton *)pushViewControllerButton
{
}


#pragma mark - FBFriendPickerDelegate
/*!
 @abstract
 Tells the delegate that data has been loaded.

 @discussion
 The <FBFriendPickerViewController> object's `tableView` property is automatically
 reloaded when this happens. However, if another table view, for example the
 `UISearchBar` is showing data, then it may also need to be reloaded.

 @param friendPicker        The friend picker view controller whose data changed.
 */
- (void)friendPickerViewControllerDataDidChange:(FBFriendPickerViewController *)friendPicker
{
}

/*!
 @abstract
 Tells the delegate that the selection has changed.

 @param friendPicker        The friend picker view controller whose selection changed.
 */
- (void)friendPickerViewControllerSelectionDidChange:(FBFriendPickerViewController *)friendPicker
{
}

/*!
 @abstract
 Asks the delegate whether to include a friend in the list.

 @discussion
 This can be used to implement a search bar that filters the friend list.

 @param friendPicker        The friend picker view controller that is requesting this information.
 @param user                An <FBGraphUser> object representing the friend.
 */
- (BOOL)friendPickerViewController:(FBFriendPickerViewController *)friendPicker
                 shouldIncludeUser:(id <FBGraphUser>)user
{
    return YES;
}

/*!
 @abstract
 Tells the delegate that there is a communication error.

 @param friendPicker        The friend picker view controller that encountered the error.
 @param error               An error object containing details of the error.
 */
- (void)friendPickerViewController:(FBFriendPickerViewController *)friendPicker
                       handleError:(NSError *)error
{
}


@end
