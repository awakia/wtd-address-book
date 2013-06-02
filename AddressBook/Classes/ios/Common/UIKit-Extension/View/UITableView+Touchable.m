//  Created by Kenzan Hase
//  Copyright (c) 2013年 Kenzan Hase. All rights reserved.


#import "UITableView+Touchable.h"


#pragma mark - implementation
@implementation UITableView (Touchable)


#pragma mark - api
- (void)touchesBegan:(NSSet *)touches
           withEvent:(UIEvent *)event
{
    [super touchesBegan:touches
              withEvent:event];
    [self.nextResponder touchesBegan:touches
                           withEvent:event];
}


@end
