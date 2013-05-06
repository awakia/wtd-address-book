//  Created by Kenzan Hase
//  Copyright (c) 2013年 Kenzan Hase. All rights reserved.


#pragma mark - constant
#define kFriendListCellHeight        56


#pragma mark - interface
/// スライドして出てくるグローバルナビの選択項目cell
@interface FriendListCell : UITableViewCell {
}


#pragma mark - property
/// アイコン
@property (nonatomic, weak) IBOutlet UIImageView *iconImageView;;
/// タイトルlabel
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;

/// タッチダウンイベント
@property (copy) void (^touchedDownInsideBlockWithCell)(FriendListCell *);
/// タッチアップイベント
@property (copy) void (^touchedUpInsideBlockWithCell)(FriendListCell *);

#pragma mark - api
/**
 * 見た目を調整
 */
- (void)design;


@end
