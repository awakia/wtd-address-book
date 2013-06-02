//  Created by Kenzan Hase
//  Copyright (c) 2013年 Kenzan Hase. All rights reserved.


#import "JSMessagesViewController.h"
#import "PopupView.h"


#pragma mark - interface
/// チャット画面
@interface MessageViewController : JSMessagesViewController <JSMessagesViewDelegate, JSMessagesViewDataSource, PopupViewDelegate> {
}


#pragma mark - property
/// メッセージ一覧
@property (strong) NSMutableArray *messages;
/// メッセージ投稿時間一覧
@property (strong) NSMutableArray *timestamps;


@end
