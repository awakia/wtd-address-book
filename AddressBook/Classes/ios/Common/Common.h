//  Created by Kenzan Hase
//  Copyright (c) Kenzan Hase. All rights reserved.


#pragma mark - constant

#pragma mark - 設定

/// 連絡先を同期する数(Gmail, Facebook)
#define kSyncContactCount 2


#pragma mark - デザイン

/// ナビゲーションバー高さデフォルト値
#define kNavigationBarDefaultHeight                 44

/// Viewの角丸デフォルト値
#define kViewDefaultCornerRadius                    5

/// ナビゲーションバー中央ボタンサイズ
#define kNavigationBarCenterButtonSize             (CGSize){232.0, 32.0,}

/// ナビゲーションバー影位置
#define kNavigationBarShadowOffset                  (CGSize){0.0, 2.0,}
/// ナビゲーションバー影不透明度
#define kNavigationBarShadowOpacity                 0.4f


#pragma mark - Storyboard

/// チュートリアル
#define kTutorialStoryboard                          @"TutorialStoryboard"
/// RootView
#define kRootViewStoryboard                          @"RootViewStoryboard"


#pragma mark - NSUserDefaults

/// ユーザーエージェント
#define kUserDefaultsKeyForUserAgent                @"UserAgent"


#pragma mark - NSNotification

/// チュートリアル終了通知
#define kNotificationTutorialDidFinished            @"NotificationTutorialDidFinished"


#pragma mark - 画像

/// 透明
#define kImageClear                                 @"common_clear.png"

/// 白ボタン
#define kImageDefaultWhiteButton                    @"common_btn_cancel.png"
/// 白ボタン押下
#define kImageDefaultWhiteButtonTouched             @"common_btn_cancel_pressed.png"

/// 白戻るボタン
#define kImageBackWhiteButton                       @"common_btn_back"
/// 白戻るボタン押下
#define kImageBackWhiteButtonTouched                @"common_btn_back_pressed"
