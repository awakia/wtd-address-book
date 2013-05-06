//  Created by Kenzan Hase
//  Copyright (c) Kenzan Hase. All rights reserved.


#import "FriendListViewController.h"
// Cell
#import "FriendListCell.h"
// UIKit-Extension
#import "UINavigationItem+Custom.h"


#pragma mark - constant

/// セルのタイトルラベル
#define kTableListTitle             @"title"
/// セルのアイコン画像
#define kTableListIcon              @"icon"
/// セルのタッチイベント
#define kTableListEventListener     @"eventListener"


#pragma mark - implementation
@implementation FriendListViewController


#pragma mark - synthesize
@synthesize tableView;


#pragma mark - initializer
- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super initWithCoder:decoder];
    if (self) {
        self.tableList = [[NSMutableArray alloc] initWithArray:@[
            @{
                kTableListTitle:@"山田 花子",
                kTableListIcon:@"hanako.jpg",
                kTableListEventListener:NSStringFromSelector(@selector(pushMessageDetailViewControllerWithCell:))
            },
        ]];
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
- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = kFriendListCellHeight;
    return height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *className = NSStringFromClass([FriendListCell class]);
    FriendListCell *cell = [self.tableView dequeueReusableCellWithIdentifier:className];
    if (cell == nil) {
        UINib *nib = [UINib nibWithNibName:className bundle:nil];
        cell = [[nib instantiateWithOwner:nil options:nil] objectAtIndex:0];

        // レイアウト
        NSDictionary *properties = self.tableList[indexPath.row];
        [[cell titleLabel] setText:properties[kTableListTitle]];
        [[cell iconImageView] setImage:[UIImage imageNamed:properties[kTableListIcon]]];
        [cell design];

        // タッチダウンイベント
        [cell setTouchedDownInsideBlockWithCell:^ (FriendListCell *cell) {}];
        // タッチアップイベント
        [cell setTouchedUpInsideBlockWithCell:^ (FriendListCell *cell) {
            if ([[properties allKeys] containsObject:kTableListEventListener]) {
                SEL selector = NSSelectorFromString(properties[kTableListEventListener]);
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                if ([self respondsToSelector:selector]) { [self performSelector:selector withObject:cell]; }
#pragma clang diagnostic pop
            }
        }];
    }
    return cell;
}


#pragma mark - private api
/**
 * メッセージ詳細画面
 */
//- (void)pushMessageDetailViewControllerWithCell:(MessageFriendCell *)cell
//{
//    MessageDetailViewController *vc = [[MessageDetailViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
//}

@end
