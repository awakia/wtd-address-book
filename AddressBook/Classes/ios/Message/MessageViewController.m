//  Created by Kenzan Hase
//  Copyright (c) 2013年 Kenzan Hase. All rights reserved.


#import "MessageViewController.h"
// Popup
#import "MessageAddressPopupView.h"
// UIKit-Extension
#import "UINavigationBar+Custom.h"
#import "UINavigationItem+Custom.h"
#import "UITableView+Touchable.h"


#pragma mark - implementation
@implementation MessageViewController


#pragma mark - synthesize
@synthesize messages;
@synthesize timestamps;


#pragma mark - lifecycle
- (void)loadView
{
    [super loadView];

    self.delegate = self;
    self.dataSource = self;

    self.messages = [NSMutableArray arrayWithArray:@[
        @"Testing some messages here.",
        @"This work is based on Sam Soffes' SSMessagesViewController.",
        @"This is a complete re-write and refactoring.",
        @"It's easy to implement. Sound effects and images included. Animations are smooth and messages can be of arbitrary size!",
    ]];

    self.timestamps = [[NSMutableArray alloc] initWithObjects:
                       [NSDate distantPast],
                       [NSDate distantPast],
                       [NSDate distantPast],
                       [NSDate date],
                       nil];

    // ナビゲーションバー
/*
    [self.navigationItem designMessageNavigationItemWithLeftTarget:self
                                                      leftSelector:@selector(touchedUpInsideWithLeftButton:)
                                                       rightTarget:self
                                                     rightSelector:@selector(touchedUpInsideWithRightButton:)];
*/
    [self.navigationController.navigationBar setMessageNavigationBarButtonWithTitle:@"Wantedlyさん他3人"
                                                                             target:self
                                                                           selector:@selector(touchedUpInsideWithNavigationBarButton:)];
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


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return self.messages.count;
}


#pragma mark - JSMessagesViewDelegate
- (void)sendPressed:(UIButton *)sender
           withText:(NSString *)text
{
    [self.messages addObject:text];
    [self.timestamps addObject:[NSDate date]];
    if  ((self.messages.count - 1) % 2) {
        [JSMessageSoundEffect playMessageSentSound];
    }
    else {
        [JSMessageSoundEffect playMessageReceivedSound];
    }

    [self finishSend];
}

- (JSBubbleMessageStyle)messageStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (indexPath.row % 2) ? JSBubbleMessageStyleIncomingDefault : JSBubbleMessageStyleOutgoingDefault;
}

- (JSMessagesViewTimestampPolicy)timestampPolicyForMessagesView
{
    return JSMessagesViewTimestampPolicyEveryThree;
}

- (BOOL)hasTimestampForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self shouldHaveTimestampForRowAtIndexPath:indexPath];
}


#pragma mark - JSMessagesViewDataSource
- (NSString *)textForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.messages objectAtIndex:indexPath.row];
}

- (NSDate *)timestampForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.timestamps objectAtIndex:indexPath.row];
}


#pragma mark - PopupViewDelegate
/**
 * ポップアップが消えた時に呼ばれる
 */
- (void)disappearWithPopupView:(PopupView *)popupView
{
}


#pragma mark - event listener
- (IBAction)touchedUpInsideWithLeftButton:(UIButton *)button
{
    [self textViewDidEndEditing:self.inputView.textView];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)touchedUpInsideWithRightButton:(UIButton *)button
{
}

- (IBAction)touchedUpInsideWithNavigationBarButton:(UIButton *)button
{
    // ポップアップ
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([MessageAddressPopupView class])
                                bundle:nil];
    MessageAddressPopupView *popup = [nib instantiateWithOwner:nil options:nil][0];
    [popup setPopupViewDelegate:self];
    [popup appear];

    [self textViewDidEndEditing:self.inputView.textView];
}


#pragma mark - api
- (UIButton *)sendButton
{
    return [UIButton defaultSendButton];
}


#pragma mark - private api
- (void)touchesBegan:(NSSet *)touches
           withEvent:(UIEvent *)event
{
    BOOL hit = CGRectContainsPoint(self.tableView.frame,
                                   [[[event allTouches] anyObject] locationInView:self.view]);
    if (hit) {
        [self textViewDidEndEditing:self.inputView.textView];
    }
}


@end
