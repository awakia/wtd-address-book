//  Created by Kenzan Hase
//  Copyright (c) Kenzan Hase. All rights reserved.


#import "MessageAddressPopupView.h"
// UI
#import "FUIButton.h"
#import <QuartzCore/QuartzCore.h>
// Extension
#import "UIColor+FlatUI.h"


#pragma mark - MessageAddressPopupView
@implementation MessageAddressPopupView


#pragma mark - synthesize
@synthesize toButton;
@synthesize ccButton;
@synthesize bccButton;
@synthesize toView;
@synthesize ccView;
@synthesize bccView;


#pragma mark - event listener
- (IBAction)touchedUpInsidWithButton:(UIButton *)button
{
    //to:
    if (button == self.toButton) {
        [self designWithButton:self.toButton];
    }
    //cc:
    else if (button == self.ccButton) {
        [self designWithButton:self.ccButton];
    }
    //bcc:
    else if (button == self.bccButton) {
        [self designWithButton:self.bccButton];
    }
}


#pragma mark - api
- (void)appearInView:(UIView *)parentView
{
    [self design];

    // 表示
    [super appearInView:parentView];
    CGRect endFrame = self.contentView.frame;
    // アニメーション
    self.contentView.frame = CGRectMake(self.contentView.frame.origin.x, -self.contentView.frame.size.height, self.contentView.frame.size.width, self.contentView.frame.size.height);
    [UIView animateWithDuration:0.30f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^ () { self.contentView.frame = endFrame; }
                     completion:^ (BOOL finished) {}];
}

- (void)disappear
{
    // アニメーション
    [UIView animateWithDuration:0.15f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^ () {
        self.contentView.frame = CGRectMake(self.contentView.frame.origin.x, -self.contentView.frame.size.height, self.contentView.frame.size.width, self.contentView.frame.size.height);
    }
                     completion:^ (BOOL finished) { [super disappear]; }];
}


#pragma mark - private api
/**
 * 見た目を調整
 */
- (void)design
{
    // to:
    self.toButton.buttonColor = [UIColor alizarinColor];
    self.toButton.shadowColor = [UIColor pomegranateColor];
    self.toButton.shadowHeight = 6.0f;
    // cc:
    self.ccButton.buttonColor = [UIColor carrotColor];
    self.ccButton.shadowColor = [UIColor pumpkinColor];
    self.ccButton.shadowHeight = 6.0f;
    // bcc:
    self.bccButton.buttonColor = [UIColor sunflowerColor];
    self.bccButton.shadowColor = [UIColor tangerineColor];
    self.bccButton.shadowHeight = 6.0f;

    [self designWithButton:self.toButton];
}

/**
 * to:,cc:,bcc:の見た目を調整
 * @param 押下されたボタン
 */
- (void)designWithButton:(FUIButton *)selectedButton
{
    [self designViewWidthWithButton:selectedButton];
    [self designViewBorderWithButton:selectedButton];
}

/**
 * to:,cc:,bcc:の幅を調整
 * @param 押下されたボタン
 */
- (void)designViewWidthWithButton:(FUIButton *)selectedButton
{
    NSArray *buttons = @[self.toButton, self.ccButton, self.bccButton];
    NSArray *views = @[self.toView, self.ccView, self.bccView];

    // ボタンの大きさ、どのボタンが選択されているか計算
    NSInteger selectedIndex = 0;
    CGFloat minWidth = selectedButton.frame.size.width;
    for (NSInteger index = 0; index < [buttons count]; index++) {
        FUIButton *button = buttons[index];
        if (button.frame.size.width < minWidth) { minWidth = ((UIView *)views[index]).frame.size.width; }
        if (button == selectedButton) { selectedIndex = index; }
    }
    CGFloat maxWidth = self.contentView.frame.size.width - minWidth * ([buttons count] - 1);

    // アニメーション
    [UIView animateWithDuration:0.15f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveLinear
                     animations:^ () {
    // 選択中のエリアだけ大きく表示
    CGFloat offsetX = 0;
    for (NSInteger index = 0; index < [views count]; index++) {
        UIView *v = views[index];
        CGRect newFrame = v.frame;
        if (index == selectedIndex) {
            newFrame = CGRectMake(offsetX, newFrame.origin.y, maxWidth, newFrame.size.height);
        }
        else {
            newFrame = CGRectMake(offsetX, newFrame.origin.y, minWidth, newFrame.size.height);
        }
        v.frame = newFrame;
        offsetX += newFrame.size.width;
    }

    }
                     completion:^ (BOOL finished) {}];
}

/**
 * to:,cc:,bccの枠を調整
 * @param 押下されたボタン
 */
- (void)designViewBorderWithButton:(FUIButton *)selectedButton
{
/*
    NSArray *buttons = @[self.toButton, self.ccButton, self.bccButton];
    for (FUIButton *button in buttons) {
        [button.layer setBorderColor:[[UIColor clearColor] CGColor]];
        [button.layer setBorderWidth:1.0f];
    }

    if (self.toButton == selectedButton) {
        [self.toView.layer setBorderColor:[[UIColor pomegranateColor] CGColor]];
        [self.toView.layer setBorderWidth:1.0f];
    }
    if (self.ccButton == selectedButton) {
        [self.ccView.layer setBorderColor:[[UIColor pumpkinColor] CGColor]];
        [self.ccView.layer setBorderWidth:1.0f];
    }
    if (self.bccButton == selectedButton) {
        [self.bccView.layer setBorderColor:[[UIColor tangerineColor] CGColor]];
        [self.bccView.layer setBorderWidth:1.0f];
    }
*/
}


@end
