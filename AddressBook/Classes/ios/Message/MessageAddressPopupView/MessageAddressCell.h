//  Created by Kenzan Hase
//  Copyright (c) 2013年 Kenzan Hase. All rights reserved.


#pragma mark - constant
#define kMessageAddressCellHeight        44


#pragma mark - MessageAddressCell
/// TO:,CC:,BCC:のリスト表示用のセル
@interface MessageAddressCell : UITableViewCell {
}


#pragma mark - property
/// ユーザーアイコン
@property (nonatomic, weak) IBOutlet UIImageView *iconImageView;
/// ユーザー名
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;


@end
