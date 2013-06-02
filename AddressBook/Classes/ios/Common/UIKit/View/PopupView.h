//  Created by Kenzan Hase
//  Copyright (c) Kenzan Hase. All rights reserved.


#pragma mark - class
@class PopupView;


#pragma mark - PopupViewDelegate
@protocol PopupViewDelegate <NSObject>

/**
 * ポップアップが消えた時に呼ばれる
 */
- (void)disappearWithPopupView:(PopupView *)popupView;


@end


#pragma mark - PopupView
/// ポップアップ
@interface PopupView : UIView {
}


#pragma mark - property
/// ポップアップの背景
@property (weak, nonatomic) IBOutlet UIView *backgroundView;
/// ポップアップの中身
@property (weak, nonatomic) IBOutlet UIView *contentView;

/// Delegate
@property (assign) id<PopupViewDelegate> popupViewDelegate;


#pragma mark - api
/**
 * parentViewの上にポップアップ表示する
 */
- (void)appear;

/**
 * ポップアップを閉じる
 */
- (void)disappear;


@end
