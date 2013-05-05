//  Created by Kenzan Hase
//  Copyright (c) Kenzan Hase. All rights reserved.


#import "UIButton+Custom.h"


#pragma mark - implementation
@implementation UIButton (Custom)


#pragma mark - api
- (void)setTitleColor:(UIColor *)titleColor
     titleShadowColor:(UIColor *)titleShadowColor
{
    NSInteger states[4] = {
        UIControlStateNormal,
        UIControlStateHighlighted,
        UIControlStateDisabled,
        UIControlStateSelected
    };
    for (int i = 0; i < 4; i++) {
        [self setTitleColor:titleColor forState:states[i]];
        [self setTitleShadowColor:titleShadowColor forState:states[i]];
    }
}


@end
