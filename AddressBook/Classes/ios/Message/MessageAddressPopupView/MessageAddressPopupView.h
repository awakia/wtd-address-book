//  Created by Kenzan Hase
//  Copyright (c) Kenzan Hase. All rights reserved.


#import "PopupView.h"
#import "DragAndDropTableView.h"


#pragma mark - class
@class FUIButton;


#pragma mark - MessageAddressPopupView
/// to,cc,bccアドレス追加用のポップアップUI
@interface MessageAddressPopupView : PopupView <UITableViewDelegate, UITableViewDataSource, DragAndDropTableViewDelegate, DragAndDropTableViewDataSource> {
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
/// TO:のリストテーブル
@property (weak, nonatomic) IBOutlet DragAndDropTableView *toTableView;
/// CC:のリストテーブル
@property (weak, nonatomic) IBOutlet DragAndDropTableView *ccTableView;
/// BCC:のリストテーブル
@property (weak, nonatomic) IBOutlet DragAndDropTableView *bccTableView;

/// TO:一覧リスト
@property (strong) NSArray *toList;
/// CC:一覧リスト
@property (strong) NSArray *ccList;
/// BCC:一覧リスト
@property (strong) NSArray *bccList;


#pragma mark - event listener
- (IBAction)touchedUpInsidWithButton:(UIButton *)button;


@end
