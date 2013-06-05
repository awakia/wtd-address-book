//  Created by Kenzan Hase
//  Copyright (c) Kenzan Hase. All rights reserved.


#import "PopupView.h"


#pragma mark - class
@class FUIButton;


#pragma mark - MessageAddressPopupView
/// to,cc,bccアドレス追加用のポップアップUI
@interface MessageAddressPopupView : PopupView {
}


#pragma mark - property
/// TO:ボタン
@property (weak, nonatomic) IBOutlet FUIButton *toButton;
/// CC:ボタン
@property (weak, nonatomic) IBOutlet FUIButton *ccButton;
/// BCC:ボタン
@property (weak, nonatomic) IBOutlet FUIButton *bccButton;
/// TO:View
@property (weak, nonatomic) IBOutlet UIView *toView;
/// CC:View
@property (weak, nonatomic) IBOutlet UIView *ccView;
/// BCC:View
@property (weak, nonatomic) IBOutlet UIView *bccView;


#pragma mark - event listener
- (IBAction)touchedUpInsidWithButton:(UIButton *)button;


@end
