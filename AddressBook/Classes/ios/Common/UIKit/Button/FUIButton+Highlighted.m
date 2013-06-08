//  Created by Kenzan Hase
//  Copyright (c) 2013年 Kenzan Hase. All rights reserved.


#import "FUIButton+Highlighted.h"
#import "UIImage+FlatUI.h"


#pragma mark - FUIButton+Highlighted
@implementation FUIButton (Highlighted)


#pragma mark - api
- (void)setHighlightedColor:(UIColor *)color
{
    [self configureFlatButtonWithHighlightedColor:color];
}


#pragma mark - private api
- (void)configureFlatButtonWithHighlightedColor:(UIColor *)color
{
    UIImage *normalBackgroundImage = [UIImage buttonImageWithColor:self.buttonColor
                                                      cornerRadius:self.cornerRadius
                                                       shadowColor:self.shadowColor
                                                      shadowInsets:UIEdgeInsetsMake(0, 0, self.shadowHeight, 0)];
    UIImage *highlightedBackgroundImage = [UIImage buttonImageWithColor:color
                                                           cornerRadius:self.cornerRadius
                                                            shadowColor:[UIColor clearColor]
                                                           shadowInsets:UIEdgeInsetsMake(self.shadowHeight, 0, 0, 0)];

    [self setBackgroundImage:normalBackgroundImage forState:UIControlStateNormal];
    [self setBackgroundImage:highlightedBackgroundImage forState:UIControlStateHighlighted];
}


@end
