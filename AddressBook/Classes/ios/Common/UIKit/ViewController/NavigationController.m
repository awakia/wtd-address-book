//  Created by Kenzan Hase
//  Copyright (c) Kenzan Hase. All rights reserved.


#import "NavigationController.h"
// UIKit-Extension
#import "UINavigationBar+Custom.h"


#pragma mark - implementation
@implementation NavigationController


#pragma mark - initializer
- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (id)initWithRootViewController:(UIViewController *)vc
{
    self = [super initWithRootViewController:vc];
    if (self) {
    }
    return self;
}


#pragma mark - lifecycle
- (void)loadView
{
    [super loadView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
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


@end
