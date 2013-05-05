//  Created by Kenzan Hase
//  Copyright (c) Kenzan Hase. All rights reserved.


#pragma mark - interface
/// ボタンカスタマイズ
@interface UIButton (Custom)


#pragma mark - api
/**
 * ボタンのタイトルカラーを設定
 * @param 文字色
 * @param 影色
 */
- (void)setTitleColor:(UIColor *)titleColor
     titleShadowColor:(UIColor *)titleShadowColor;


@end
