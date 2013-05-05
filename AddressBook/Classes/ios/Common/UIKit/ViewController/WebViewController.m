//  Created by Kenzan Hase
//  Copyright (c) Kenzan Hase. All rights reserved.


#import "WebViewController.h"
// NSFoundation-Extension
#import "NSURLRequest+Wantedly.h"


#pragma mark - implementation
@implementation WebViewController


#pragma mark - synthesize
@synthesize webView;


#pragma mark - lifecycle
- (void)loadView
{
    [super loadView];

    // スクロール速度
    self.webView.scrollView.decelerationRate = UIScrollViewDecelerationRateNormal;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}


#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView
shouldStartLoadWithRequest:(NSURLRequest *)request
 navigationType:(UIWebViewNavigationType)navigationType
{
/*
    NSInteger type = (NSInteger)navigationType;
    switch (type) {
        case UIWebViewNavigationTypeLinkClicked:
            break;
    }
*/
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.webView stringByEvaluatingJavaScriptFromString:
        @"$('#navBar').remove(); $('#project_count').remove(); $('#footer').remove();"
    ];
}

- (void)webView:(UIWebView *)webView
didFailLoadWithError:(NSError *)error
{
}


#pragma mark - api
- (void)loadURL:(NSURL *)URL
{
    [self.webView loadRequest:[NSMutableURLRequest wantedlyRequestWithURL:URL]];
}


@end
