//  Created by Kenzan Hase
//  Copyright (c) Kenzan Hase. All rights reserved.


#import "SyncContactViewController.h"
#import <QuartzCore/QuartzCore.h>


#pragma mark - implementation
@implementation SyncContactViewController


#pragma mark - synthesize
@synthesize navigationBarView;

@synthesize scrollView;

@synthesize syncGmailButton;
@synthesize skipSyncGmailButton;
@synthesize syncFacebookButton;
@synthesize skipSyncFacebookButton;


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

    // ナビゲーションバー代わり
    self.navigationBarView.layer.shadowOffset = kNavigationBarShadowOffset;
    self.navigationBarView.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.navigationBarView.layer.shadowOpacity = kNavigationBarShadowOpacity;
    self.navigationBarView.layer.shadowPath = [[UIBezierPath bezierPathWithRect:self.navigationBarView.bounds] CGPath];

    // スクロールビュー
    [self.scrollView setContentSize:CGSizeMake(self.view.frame.size.width * kSyncContactCount, self.view.frame.size.height - kNavigationBarDefaultHeight)];
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
- (IBAction)touchedUpInsideWithButton:(UIButton *)button
{
    // ボタンごとの挙動
    if (button == self.syncGmailButton) {
    }
    else if (button == self.skipSyncGmailButton) {
        // スクロール
        NSInteger nextPage = self.scrollView.contentOffset.x / self.view.frame.size.width;
        [self setScrollViewContentOffsetWithNextPage:nextPage];
    }
    else if (button == self.syncFacebookButton) {
    }
    else if (button == self.skipSyncFacebookButton) {
    }
}


#pragma mark - private api
/**
 * スクロールする
 * @param nextPage 次に移動するページ
 */
- (void)setScrollViewContentOffsetWithNextPage:(NSInteger)nextPage
{
    [self.scrollView setContentOffset:CGPointMake(self.view.frame.size.width * (nextPage + 1), 0)
                             animated:YES];
}


@end
