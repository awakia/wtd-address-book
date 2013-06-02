//  Created by Kenzan Hase
//  Copyright (c) Kenzan Hase. All rights reserved.


#import "PopupView.h"


#pragma mark - PopupView
@implementation PopupView


#pragma mark - synthesize
@synthesize contentView;

@synthesize popupViewDelegate;


#pragma mark - api
- (void)appear
{
    // 表示
    UIWindow *window = [[UIApplication sharedApplication] windows][0];
    [window addSubview:self];
}


#pragma mark - private api
/**
 * タッチイベント
 * @param touches touches
 * @param event event
 */
-(void)touchesBegan:(NSSet *)touches
          withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];

    // 含有判定
    BOOL contain = CGRectContainsPoint(self.contentView.frame,
                                       [[[event allTouches] anyObject] locationInView:self]);
    if (contain == NO) {// ポップアップ範囲外をタッチしたら閉じる
        [self disappear];
    }
}

/**
 * ポップアップを閉じる
 */
- (void)disappear
{
    [self removeFromSuperview];

    if (self.popupViewDelegate &&
        [self.popupViewDelegate respondsToSelector:@selector(disappearWithPopupView:)]) {

        [self.popupViewDelegate disappearWithPopupView:self];
    }
}


@end
