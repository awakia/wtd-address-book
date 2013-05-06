//  Created by Kenzan Hase
//  Copyright (c) 2013年 Kenzan Hase. All rights reserved.


#import "FriendListCell.h"
// design
#import <QuartzCore/QuartzCore.h>


#pragma mark - interface
@interface FriendListCell()


#pragma mark - event listener
- (IBAction)touchedDownInsideWithButton:(UIButton *)button;
- (IBAction)touchedUpInsideWithButton:(UIButton *)button;


@end


#pragma mark - implementation
@implementation FriendListCell


#pragma mark - property
@synthesize iconImageView;;
@synthesize titleLabel;
@synthesize touchedDownInsideBlockWithCell;
@synthesize touchedUpInsideBlockWithCell;


#pragma mark - event listener
- (IBAction)touchedDownInsideWithButton:(UIButton *)button
{
    if (self.touchedDownInsideBlockWithCell) {
        self.touchedDownInsideBlockWithCell(self);
    }
}

- (IBAction)touchedUpInsideWithButton:(UIButton *)button
{
    if (self.touchedUpInsideBlockWithCell) {
        self.touchedUpInsideBlockWithCell(self);
    }
}


#pragma mark - api
- (void)design
{
    // アイコン角丸
    self.iconImageView.layer.cornerRadius = kViewDefaultCornerRadius;
    self.iconImageView.clipsToBounds = YES;
}


@end
