//  Created by Kenzan Hase
//  Copyright (c) Kenzan Hase. All rights reserved.


#import "TutorialViewController.h"
#import <QuartzCore/QuartzCore.h>


#pragma mark - implementation
@implementation TutorialViewController


#pragma mark - synthesize
@synthesize scrollView;
@synthesize pageControl;

@synthesize completeButtonBackgroundView;


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

    // スクロールビュー
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width * kTutorialPageCount, self.scrollView.frame.size.height)];
    [self.pageControl setNumberOfPages:kTutorialPageCount];

    // シャドー
    self.completeButtonBackgroundView.layer.shadowOffset = CGSizeMake(0.0f, -1.0f);
    self.completeButtonBackgroundView.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.completeButtonBackgroundView.layer.shadowOpacity = 0.3f;
    self.completeButtonBackgroundView.layer.shadowPath = [[UIBezierPath bezierPathWithRect:self.completeButtonBackgroundView.bounds] CGPath];
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


#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 今いるページの位置を表示
    NSInteger page = self.scrollView.contentOffset.x / self.scrollView.frame.size.width;
    if (page < 0) { page = 0; }
    else if (page >= kTutorialPageCount) { page = kTutorialPageCount - 1; }
    [self.pageControl setCurrentPage:page];
}


#pragma mark - event listener
- (IBAction)touchedUpInsideWithCompleteButton:(UIButton *)completeButton
{
    // チュートリアル終了
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationTutorialDidFinished
                                                        object:self
                                                      userInfo:nil];
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
