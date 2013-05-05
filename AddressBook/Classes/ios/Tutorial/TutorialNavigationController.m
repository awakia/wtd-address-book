//  Created by Kenzan Hase
//  Copyright (c) Kenzan Hase. All rights reserved.


#import "TutorialNavigationController.h"


#pragma mark - implementation
@implementation TutorialNavigationController


#pragma mark - initializer
- (id)init
{
    self = [super init];
    if (self) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:kTutorialStoryboard
                                                             bundle:nil];
        UIViewController *vc = [storyboard instantiateInitialViewController];
        [self setViewControllers:@[vc]];
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
