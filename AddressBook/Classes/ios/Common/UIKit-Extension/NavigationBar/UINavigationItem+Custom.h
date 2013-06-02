//  Created by Kenzan Hase
//  Copyright (c) Kenzan Hase. All rights reserved.


#pragma mark - interface
/// カスタムデザインのNavigationItem
@interface UINavigationItem (Custom)


/**
 * メッセージ画面のナビゲーションアイテムをデザイン
 * @param leftTarget leftTarget
 * @param leftSelector leftSelector
 * @param rightTarget rightTarget
 * @param rightSeclector rightSeclector
 */
- (void)designMessageNavigationItemWithLeftTarget:(id)leftTarget
                                     leftSelector:(SEL)leftSelector
                                      rightTarget:(id)rightTarget
                                    rightSelector:(SEL)rightSelector;

/**
 * デフォルトのナビゲーションアイテムをデザイン
 * @param leftTarget leftTarget
 * @param leftSelector leftSelector
 * @param rightTarget rightTarget
 * @param rightSeclector rightSeclector
 */
/*
- (void)designWantedlyDefaultNavigationItemWithLeftTarget:(id)leftTarget
                                             leftSelector:(SEL)leftSelector
                                              rightTarget:(id)rightTarget
                                            rightSelector:(SEL)rightSelector;
*/
/**
 * 2階層目のナビゲーションアイテムをデザイン
 * @param leftTarget leftTarget
 * @param leftSelector leftSelector
 * @param rightTarget rightTarget
 * @param rightSeclector rightSeclector
 */
/*
- (void)designWantedlyPushedNavigationItemWithLeftTarget:(id)leftTarget
                                            leftSelector:(SEL)leftSelector
                                             rightTarget:(id)rightTarget
                                           rightSelector:(SEL)rightSelector;
*/
/**
 * ナビゲーションアイテムをリセット
 */
- (void)resetBarButtonItems;


@end
