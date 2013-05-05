//  Created by Kenzan Hase
//  Copyright (c) Kenzan Hase. All rights reserved.


#pragma mark - interface
/// WebViewを表示する
@interface WebViewController : UIViewController <UIWebViewDelegate> {
}


#pragma mark - property
/// WebView
@property (nonatomic, weak) IBOutlet UIWebView *webView;


#pragma mark - api
/**
 * WebViewに指定URLを読み込む
 * @param URL URL
 */
- (void)loadURL:(NSURL *)URL;


@end
