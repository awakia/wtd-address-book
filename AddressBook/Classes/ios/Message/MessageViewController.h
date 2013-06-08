//  Created by Kenzan Hase
//  Copyright (c) 2013年 Kenzan Hase. All rights reserved.


#import "JSMessagesViewController.h"
#import "PopupView.h"


#pragma mark - class
@class MessageAddressPopupView;
@class FUIButton;


#pragma mark - interface
/// チャット画面
@interface MessageViewController : JSMessagesViewController <JSMessagesViewDelegate, JSMessagesViewDataSource, PopupViewDelegate> {
}


#pragma mark - property
/// ナビゲーションバー右上ボタン
@property (nonatomic, weak) FUIButton *rightButton;

/// メッセージ一覧
@property (strong) NSMutableArray *messages;
/// メッセージ投稿時間一覧
@property (strong) NSMutableArray *timestamps;

/// アドレス追加用UI
@property (weak) MessageAddressPopupView *addressPopupView;


@end
