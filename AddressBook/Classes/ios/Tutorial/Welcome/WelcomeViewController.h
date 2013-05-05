//  Created by Kenzan Hase
//  Copyright (c) Kenzan Hase. All rights reserved.


#pragma mark - interface
/// アプリ開始のログイン訴求画面
@interface WelcomeViewController : UIViewController {
}


#pragma mark - event listener
/**
 * アプリ開始ログイン訴求ボタン押下
 * @param loginButton loginButton
 */
- (IBAction)touchedUpInsideWithLoginButton:(UIButton *)loginButton;

/**
 * 連絡先の同期訴求をする画面へ遷移
 * @param pushViewControllerButton pushViewControllerButton
 */
- (IBAction)touchedUpInsideWithPushViewControllerButton:(UIButton *)pushViewControllerButton;


@end
