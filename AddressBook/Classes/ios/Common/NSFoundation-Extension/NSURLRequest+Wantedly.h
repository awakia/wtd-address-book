//  Created by Kenzan Hase
//  Copyright (c) Kenzan Hase. All rights reserved.


#import "NSURLRequest+Wantedly.h"


#pragma mark - interface
/// NSMutableURLRequestのWantedly拡張
@interface NSMutableURLRequest (Wantedly)

/**
 * リクエストに付けて送るユーザーエージェントを設定
 */
+ (void)initUserAgent;

/**
 * Wantedlyアプリのユーザーエージェントを付けたリクエストを生成
 * @param URL URL
 */
+ (NSMutableURLRequest *)wantedlyRequestWithURL:(NSURL *)URL;


@end
