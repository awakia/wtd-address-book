//  Created by Kenzan Hase
//  Copyright (c) Kenzan Hase. All rights reserved.


#import "UINavigationItem+Custom.h"
// UIKit-Extension
#import "UIButton+Custom.h"
#import "UIColor+Hexadecimal.h"


#pragma mark - implementation
@implementation UINavigationItem (Custom)


#pragma mark - api
- (void)setBarButtonItemWithLeftButton:(UIButton *)leftButton
                           rightButton:(UIButton *)rightButton
{
    self.leftBarButtonItem = [UINavigationItem barButtonItemWithButton:leftButton];
    self.rightBarButtonItem = [UINavigationItem barButtonItemWithButton:rightButton];
}

- (void)resetBarButtonItems
{
    NSMutableArray *items = [NSMutableArray array];
    if (self.leftBarButtonItem) { [items addObject:self.leftBarButtonItem]; }
    if (self.rightBarButtonItem) { [items addObject:self.rightBarButtonItem]; }

    for (UIBarButtonItem *item in items) {
        if (item.customView && [[item.customView class] isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)item.customView;
            [btn setBackgroundImage:nil forState:UIControlStateNormal];
            [btn setBackgroundImage:nil forState:UIControlStateHighlighted];
            [btn setBackgroundImage:nil forState:UIControlStateDisabled];
            [btn setBackgroundImage:nil forState:UIControlStateSelected];
            [btn setTitle:nil forState:UIControlStateNormal];
            [[btn titleLabel] setFont:nil];
            [[btn titleLabel] setTextColor:nil];
        }
    }

    if (self.leftBarButtonItem) {
        self.leftBarButtonItem = nil;
    }
    if (self.rightBarButtonItem) {
        self.rightBarButtonItem = nil;
    }
}


#pragma mark - private api
/**
 * BarButtonItemを生成
 * @param buttons
 * @param target
 * @param selector
 */
+ (UIBarButtonItem *)barButtonItemWithButton:(UIButton *)button
{
    if (button) {
        CGFloat offset = (kNavigationBarDefaultHeight - button.frame.size.height);
        [button setFrame:CGRectMake(offset/2, 0, button.frame.size.width, kNavigationBarDefaultHeight-offset)];
    }
    else { return nil; }
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}


@end
