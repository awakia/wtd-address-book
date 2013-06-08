//  Created by Kenzan Hase
//  Copyright (c) 2013年 Kenzan Hase. All rights reserved.


#import "MessageViewController.h"
#import <QuartzCore/QuartzCore.h>
// Popup
#import "MessageAddressPopupView.h"
// UIKit
#import "FUIButton+Highlighted.h"
// UIKit-Extension
#import "UIViewController+MFFadeBackModalAnimation.h"
#import "UIColor+FlatUI.h"
#import "UINavigationBar+FlatUI.h"
#import "UINavigationBar+Custom.h"
#import "UINavigationItem+Custom.h"
#import "UITableView+Touchable.h"


#pragma mark - implementation
@implementation MessageViewController


#pragma mark - synthesize
@synthesize rightButton;

@synthesize messages;
@synthesize timestamps;

@synthesize addressPopupView;


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
    {   // ボタン設定
    FUIButton *button = [FUIButton buttonWithType:UIButtonTypeCustom];
    UIImage *buttonImage = [UIImage imageNamed:kImageArrowButton];
    const CGFloat offset = 6;
    [button setButtonColor:[UIColor alizarinColor]];
    [button setHighlightedColor:[UIColor pomegranateColor]];
    [button setImage:buttonImage forState:UIControlStateNormal];
    [button setFrame:CGRectMake(0, 0, buttonImage.size.width/2+offset*2, buttonImage.size.height/2+offset*2)];
    [button setImageEdgeInsets:UIEdgeInsetsMake(offset, offset, offset, offset)];
    [button setCornerRadius:4];
    [button setClipsToBounds:YES];
    [button addTarget:self
               action:@selector(touchedUpInsideWithRightButton:)
     forControlEvents:UIControlEventTouchUpInside];
    [self.navigationItem setBarButtonItemWithLeftButton:nil
                                            rightButton:button];
    self.rightButton = button;
    }
    [self.navigationController.navigationBar configureFlatNavigationBarWithColor:[UIColor cloudsColor]];
    [self.navigationController.navigationBar setNavigationBarShadow];
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
    [self.navigationItem setBarButtonItemWithLeftButton:nil
                                            rightButton:self.rightButton];
    self.rightButton.transform = CGAffineTransformMakeRotation(0);

    self.addressPopupView = nil;
}


#pragma mark - event listener
- (IBAction)touchedUpInsideWithLeftButton:(UIButton *)button
{
//    [self textViewDidEndEditing:self.inputView.textView];
//    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)touchedUpInsideWithRightButton:(UIButton *)button
{
    // ポップアップ非表示
    if (self.addressPopupView) {
        [self.addressPopupView disappear];
        button.transform = CGAffineTransformMakeRotation(0);
    }
    // ポップアップ表示
    else {
        UINib *nib = [UINib nibWithNibName:NSStringFromClass([MessageAddressPopupView class])
                                    bundle:nil];
        MessageAddressPopupView *popup = [nib instantiateWithOwner:nil options:nil][0];
        [popup setPopupViewDelegate:self];
        [popup appearInView:self.view];
        self.addressPopupView = popup;

        [self textViewDidEndEditing:self.inputView.textView];
        button.transform = CGAffineTransformMakeRotation(M_PI+0.00001f);

        // ナビゲーションバー
        {   // ボタン設定
        FUIButton *button = [FUIButton buttonWithType:UIButtonTypeCustom];
        UIImage *buttonImage = [UIImage imageNamed:kImageArrowButton];
        const CGFloat offset = 6;
        [button setButtonColor:[UIColor carrotColor]];
        [button setHighlightedColor:[UIColor pumpkinColor]];
        [button setImage:buttonImage forState:UIControlStateNormal];
        [button setFrame:CGRectMake(0, 0, buttonImage.size.width/2+offset*2, buttonImage.size.height/2+offset*2)];
        [button setImageEdgeInsets:UIEdgeInsetsMake(offset, offset, offset, offset)];
        [button setCornerRadius:4];
        [button setClipsToBounds:YES];
        [button addTarget:self
                   action:@selector(touchedUpInsideWithLeftButton:)
              forControlEvents:UIControlEventTouchUpInside];
        [self.navigationItem setBarButtonItemWithLeftButton:button
                                                rightButton:self.rightButton];
        }
    }
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
