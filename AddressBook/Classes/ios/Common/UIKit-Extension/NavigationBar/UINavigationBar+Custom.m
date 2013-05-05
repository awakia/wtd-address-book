//  Created by Kenzan Hase
//  Copyright (c) Kenzan Hase. All rights reserved.


#import "UINavigationBar+Custom.h"
// design
#import <QuartzCore/QuartzCore.h>


#pragma mark - implementation
@implementation UINavigationBar (Custom)

/*
#pragma mark - event listener
- (IBAction)touchedUpInsideWithButton:(UIButton *)button
{
}

- (IBAction)touchedDownInsideWithButton:(UIButton *)button
{
}
*/

#pragma mark - api
/*
- (void)designWantedlyDefaultNavigationBar
{
    // 背景・ロゴ
    UIImage *backgroundImage = [UIImage imageNamed:kImageCommonNavigationBarBackground];
    UIImage *logoImage = [UIImage imageNamed:kImageCommonNavigationBarLogo];
    [self setNavigationBarBackgroundImage:backgroundImage
                                logoImage:logoImage];
    //シャドー
    [self setNavigationBarShadow];
}
*/
- (void)setNavigationBarShadow
{
    // シャドー
    self.layer.shadowOffset = kNavigationBarShadowOffset;
    self.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.layer.shadowOpacity = kNavigationBarShadowOpacity;
    self.layer.shadowPath = [[UIBezierPath bezierPathWithRect:self.bounds] CGPath];
}


#pragma mark - private api
/**
 * ナビゲーションバーに背景画像とロゴをセット
 * @param backgroundImage 背景画像
 * @param logoImage ロゴ画像
 */
/*
- (void)setNavigationBarBackgroundImage:(UIImage *)backgroundImage
                              logoImage:(UIImage *)logoImage
{
    // 背景画像
    if (backgroundImage) {
        if ([self respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
            [self setBackgroundImage:backgroundImage forBarMetrics:UIBarMetricsDefault];
        }
    }

    // ロゴ
    if (logoImage) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setBackgroundImage:logoImage forState:UIControlStateNormal];

        // サイズ・位置
        CGRect logoFrame;
        logoFrame.size.width = logoImage.size.width/2;
        logoFrame.size.height = logoImage.size.height/2;
        logoFrame.origin.x = (self.bounds.size.width - logoImage.size.width/2) / 2;
        logoFrame.origin.y = (self.bounds.size.height - logoImage.size.height/2) / 2;
        [btn setFrame:logoFrame];

        // タッチイベント
        [btn addTarget:self
                action:@selector(touchedUpInsideWithButton:)
      forControlEvents:UIControlEventTouchUpInside];
        [btn addTarget:self
                action:@selector(touchedDownInsideWithButton:)
      forControlEvents:UIControlEventTouchDown];

        [self addSubview:btn];
    }
}
*/


@end
