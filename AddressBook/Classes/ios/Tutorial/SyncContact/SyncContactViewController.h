//  Created by Kenzan Hase
//  Copyright (c) Kenzan Hase. All rights reserved.


#pragma mark - interface
/// 連絡先の同期訴求をする画面
@interface SyncContactViewController : UIViewController {
}


#pragma mark - property
/// ナビゲーションバーの代わり
@property (nonatomic, weak) IBOutlet UIView *navigationBarView;

/// 連絡先を同期したいサービスごとに横に並べる
@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;

/// Gmail同期ボタン
@property (nonatomic, weak) IBOutlet UIButton *syncGmailButton;
/// Gmail同期スキップボタン
@property (nonatomic, weak) IBOutlet UIButton *skipSyncGmailButton;
/// Facebook同期ボタン
@property (nonatomic, weak) IBOutlet UIButton *syncFacebookButton;
/// Facebook同期スキップボタン
@property (nonatomic, weak) IBOutlet UIButton *skipSyncFacebookButton;


#pragma mark - event listener
/**
 * ボタン押下
 * @param button button
 */
- (IBAction)touchedUpInsideWithButton:(UIButton *)button;


@end
