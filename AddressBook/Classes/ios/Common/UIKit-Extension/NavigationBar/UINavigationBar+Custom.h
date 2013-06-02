//  Created by Kenzan Hase
//  Copyright (c) Kenzan Hase. All rights reserved.


#pragma mark - interface
/// カスタムデザインのNavigationBar
@interface UINavigationBar (Custom)


#pragma mark - api
/**
 * Wantedly用のデフォルトナビゲーションバー
 */
//- (void)designWantedlyDefaultNavigationBar;

/**
 * ナビゲーションバーの下の影を付ける
 */
- (void)setNavigationBarShadow;

/**
 * ナビゲーションバーの中央にボタンをつける
 * @param title ボタンtitle
 * @param target ボタンのタッチイベントリスナー親
 * @param selector ボタンのタッチイベントリスナー
 */
- (void)setMessageNavigationBarButtonWithTitle:(NSString *)title
                                        target:(id)target
                                      selector:(SEL)selector;


@end
