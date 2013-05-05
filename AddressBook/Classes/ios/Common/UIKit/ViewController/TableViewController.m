//  Created by Kenzan Hase
//  Copyright (c) Kenzan Hase. All rights reserved.


#import "TableViewController.h"


#pragma mark - implementation
@implementation TableViewController


#pragma mark - synthesize
@synthesize tableView;

@synthesize tableList;


#pragma mark - initializer
- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    if (self) {
        self.tableList = [[NSMutableArray alloc] init];
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


#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [self.tableList count];
}

/*
- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *className = NSStringFromClass([HogeCell class]);
    HogeCell *cell = [self.tableView dequeueReusableCellWithIdentifier:className];
    if (!cell) {
        UINib *nib = [UINib nibWithNibName:className bundle:nil];
        cell = [[nib instantiateWithOwner:nil options:nil] objectAtIndex:0];
    }
    return cell;
}
*/


@end
