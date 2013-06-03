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
/// to:
@property (weak, nonatomic) IBOutlet FUIButton *toButton;
/// cc:
@property (weak, nonatomic) IBOutlet FUIButton *ccButton;
/// bcc:
@property (weak, nonatomic) IBOutlet FUIButton *bccButton;


#pragma mark - event listener
- (IBAction)touchedUpInsidWithButton:(UIButton *)button;


@end
