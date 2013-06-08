//  Created by Kenzan Hase
//  Copyright (c) 2013年 Kenzan Hase. All rights reserved.


#import "MessageAddressCell.h"
// UIKit-Extension
#import "UIColor+FlatUI.h"


#pragma mark - MessageAddressCell
@implementation MessageAddressCell


#pragma mark - synthesize
@synthesize iconImageView;
@synthesize nameLabel;


#pragma mark - initializer
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
    }
    return self;
}

- (id)awakeAfterUsingCoder:(NSCoder *)aDecoder
{
   if (self) {
        UIView *bg = nil;

        CGRect rect = self.frame;
        rect.origin = CGPointMake(0, 0);

        bg = [[UIView alloc] initWithFrame:self.frame];
        [bg setBackgroundColor:[UIColor wetAsphaltColor]];
        self.backgroundView = bg;

        bg = [[UIView alloc] initWithFrame:self.frame];
        [bg setBackgroundColor:[UIColor peterRiverColor]];
        self.selectedBackgroundView = bg;
   }
   return self;
}


@end
