//  Created by Kenzan Hase
//  Copyright (c) Kenzan Hase. All rights reserved.


#import "MessageAddressPopupView.h"


#pragma mark - MessageAddressPopupView
@implementation MessageAddressPopupView


#pragma mark - synthesize


#pragma mark - api
- (void)appear
{
    [super appear];

    CGRect endFrame = self.contentView.frame;

    // アニメーション
    self.alpha = 0.0f;
    self.contentView.frame = CGRectMake(self.contentView.frame.origin.x, self.contentView.frame.origin.y, self.contentView.frame.size.width, 0);
    [UIView animateWithDuration:0.25f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^ () {
        self.alpha = 1.0f;
        self.contentView.frame = endFrame;
    }
                     completion:^ (BOOL finished) { }];
}

- (void)disappear
{
    // アニメーション
    [UIView animateWithDuration:0.20f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^ () {
        self.alpha = 0.0f;
        self.contentView.frame = CGRectMake(self.contentView.frame.origin.x, self.contentView.frame.origin.y, self.contentView.frame.size.width, 0);
    }
                     completion:^ (BOOL finished) { [super disappear]; }];
}

@end
