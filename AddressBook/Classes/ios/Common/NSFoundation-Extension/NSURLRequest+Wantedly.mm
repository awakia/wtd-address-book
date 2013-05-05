//  Created by Kenzan Hase
//  Copyright (c) Kenzan Hase. All rights reserved.


#import "NSURLRequest+Wantedly.h"


#pragma mark - implementation
@implementation NSMutableURLRequest (Wantedly)


#pragma mark - api
+ (void)initUserAgent
{
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectZero];
    NSString *userAgent = [webView stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
    NSString *currentVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
    userAgent = [NSString stringWithFormat:@"%@ WantedlyApp/1.0(Wantedly;%@;%@;)", userAgent, [NSLocale preferredLanguages][0], currentVersion];
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{kUserDefaultsKeyForUserAgent:userAgent}];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSMutableURLRequest *)wantedlyRequestWithURL:(NSURL *)URL
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    [request setUserAgent];
    return request;
}


#pragma mark - private api
/**
 * ユーザーエージェントをセット
 */
- (void)setUserAgent
{
    NSString *userAgent = [[NSUserDefaults standardUserDefaults] stringForKey:kUserDefaultsKeyForUserAgent];
    [self setValue:userAgent forHTTPHeaderField:@"User-Agent"];
}


@end
