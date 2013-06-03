//  Created by Kenzan Hase
//  Copyright (c) Kenzan Hase. All rights reserved.


#import "MessageAddressPopupView.h"
// UI
#import "FUIButton.h"
// Extension
#import "UIColor+FlatUI.h"


#pragma mark - MessageAddressPopupView
@implementation MessageAddressPopupView


#pragma mark - synthesize
@synthesize toButton;
@synthesize ccButton;
@synthesize bccButton;


#pragma mark - event listener
- (IBAction)touchedUpInsidWithButton:(UIButton *)button
{
    //to:
    if (button == self.toButton) {
        [self designButtonWidthWithButton:self.toButton];
    }
    //cc:
    else if (button == self.ccButton) {
        [self designButtonWidthWithButton:self.ccButton];
    }
    //bcc:
    else if (button == self.bccButton) {
        [self designButtonWidthWithButton:self.bccButton];
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
    self.toButton.shadowHeight = 3.0f;
    // cc:
    self.ccButton.buttonColor = [UIColor carrotColor];
    self.ccButton.shadowColor = [UIColor pumpkinColor];
    self.ccButton.shadowHeight = 3.0f;
    // bcc:
    self.bccButton.buttonColor = [UIColor sunflowerColor];
    self.bccButton.shadowColor = [UIColor tangerineColor];
    self.bccButton.shadowHeight = 3.0f;

    [self designButtonWidthWithButton:self.toButton];
}

/**
 * ボタンの幅を調整
 * @param 押下されたボタン
 */
- (void)designButtonWidthWithButton:(FUIButton *)selectedButton
{
    NSArray *buttons = @[self.toButton, self.ccButton, self.bccButton];

    // ボタンの大きさ、どのボタンが選択されているか計算
    NSInteger selectedIndex = 0;
    CGFloat minWidth = selectedButton.frame.size.width;
    for (NSInteger index = 0; index < [buttons count]; index++) {
        FUIButton *button = buttons[index];
        if (button.frame.size.width < minWidth) { minWidth = button.frame.size.width; }
        if (button == selectedButton) { selectedIndex = index; }
    }
    CGFloat maxWidth = self.contentView.frame.size.width - minWidth * ([buttons count] - 1);

    // 選択中のボタンだけ大きく表示
    CGFloat offsetX = 0;
    for (NSInteger index = 0; index < [buttons count]; index++) {
        FUIButton *button = buttons[index];
        CGRect newFrame = button.frame;
        if (index == selectedIndex) {
            newFrame = CGRectMake(offsetX, newFrame.origin.y, maxWidth, newFrame.size.height);
        }
        else {
            newFrame = CGRectMake(offsetX, newFrame.origin.y, minWidth, newFrame.size.height);
        }
        button.frame = newFrame;
        offsetX += newFrame.size.width;
    }
}


@end
