//  Created by Kenzan Hase
//  Copyright (c) Kenzan Hase. All rights reserved.


#import "PopupView.h"


#pragma mark - MessageAddressPopupView
/// ポップアップ
@interface MessageAddressPopupView : PopupView {
}


#pragma mark - property


#pragma mark - event listener
/**
 * 閉じるボタン押下
 * @param button button
 */
- (IBAction)touchedUpInsideWithCloseButton:(UIButton *)button;


@end
