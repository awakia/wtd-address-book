//  Created by Kenzan Hase
//  Copyright (c) Kenzan Hase. All rights reserved.


#pragma mark - interface
/// カスタムデザインのNavigationItem
@interface UINavigationItem (Custom)


/**
 * NavigationItemを設定
 * @param leftButton leftButton
 * @param rightButton rightButton
 */
- (void)setBarButtonItemWithLeftButton:(UIButton *)leftButton
                           rightButton:(UIButton *)rightButton;;

/**
 * NavigationItemをリセット
 */
- (void)resetBarButtonItems;


@end
