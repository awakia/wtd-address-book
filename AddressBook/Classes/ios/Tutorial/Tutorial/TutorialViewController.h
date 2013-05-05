//  Created by Kenzan Hase
//  Copyright (c) Kenzan Hase. All rights reserved.


#pragma mark - constant
/// チュートリアルページ数
#define kTutorialPageCount      4


#pragma mark - interface
/// アプリ開始のチュートリアル
@interface TutorialViewController : UIViewController {
}


#pragma mark - property
/// チュートリアルを横に並べる
@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;
/// チュートリアルの今見ているページを表示
@property (nonatomic, weak) IBOutlet UIPageControl *pageControl;

/// チュートリアル完了ボタン背景View
@property (nonatomic, weak) IBOutlet UIView *completeButtonBackgroundView;


#pragma mark - event listener
/**
 * チュートリアル完了ボタン押下
 * @param completeButton completeButton
 */
- (IBAction)touchedUpInsideWithCompleteButton:(UIButton *)completeButton;


@end
