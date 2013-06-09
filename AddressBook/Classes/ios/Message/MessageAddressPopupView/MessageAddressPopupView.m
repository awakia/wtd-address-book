//  Created by Kenzan Hase
//  Copyright (c) Kenzan Hase. All rights reserved.


#import "MessageAddressPopupView.h"
#import <QuartzCore/QuartzCore.h>
// UI
#import "MessageAddressCell.h"
// Extension
#import "FUIButton+Highlighted.h"
#import "UIColor+FlatUI.h"


#pragma mark - MessageAddressPopupView
@implementation MessageAddressPopupView


#pragma mark - synthesize
@synthesize toButton;
@synthesize ccButton;
@synthesize bccButton;
@synthesize toView;
@synthesize ccView;
@synthesize bccView;
@synthesize toTableView;
@synthesize ccTableView;
@synthesize bccTableView;

@synthesize toList;
@synthesize ccList;
@synthesize bccList;


#pragma mark - initializer
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.toList = [NSMutableArray arrayWithArray:@[
            @"リュウ", @"ケン", @"エドモンド本田", @"春麗", @"ブランカ", @"ザンギエフ", @"ガイル", @"ダルシム", @"バイソン", @"バルログ", @"サガット", @"ベガ",
        ]];
        self.ccList = [NSMutableArray arrayWithArray:@[
            @"アムロ", @"シャア", @"ララァ", @"ブライト", @"セイラ", @"ハヤト", @"カイ", @"ドズル", @"ギレン", @"キシリア", @"ガルマ",
        ]];
        self.bccList = [NSMutableArray arrayWithArray:@[
            @"フシギダネ", @"フシギソウ", @"フシギバナ", @"ヒトカゲ", @"リザード", @"リザードン", @"ゼニガメ", @"カメール", @"カメックス",
        ]];
    }
    return self;
}

- (id)awakeAfterUsingCoder:(NSCoder *)aDecoder
{
   if (self) {
   }
   return self;
}


#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    NSInteger count = 0;
    if (tableView == self.toTableView) {
        count = [self.toList count];
    }
    if (tableView == self.ccTableView) {
        count = [self.ccList count];
    }
    if (tableView == self.bccTableView) {
        count = [self.bccList count];
    }
    return count;
}

-(BOOL)tableView:(UITableView *)tableView
canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)tableView:(UITableView *)tableView
moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
     toIndexPath:(NSIndexPath *)destinationIndexPath
{
    NSArray *dataSources = @[ self.toList, self.ccList, self.bccList, ];
    NSArray *tableViews = @[ self.toTableView, self.ccTableView, self.bccTableView, ];
    NSInteger index = 0;
    for (NSInteger i = 0; i < [tableViews count]; i++) {
        if (tableView == tableViews[i]) {
            index = i;
        }
    }

    NSObject *o = dataSources[index][sourceIndexPath.row];
    [dataSources[index] removeObjectAtIndex:sourceIndexPath.row];
    [dataSources[index] insertObject:o
                             atIndex:destinationIndexPath.row];
}

-(void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *dataSources = @[ self.toList, self.ccList, self.bccList, ];
    NSArray *tableViews = @[ self.toTableView, self.ccTableView, self.bccTableView, ];
    NSInteger index = 0;
    for (NSInteger i = 0; i < [tableViews count]; i++) {
        if (tableView == tableViews[i]) {
            index = i;
        }
    }

    if (UITableViewCellEditingStyleInsert == editingStyle) {
        [tableViews[index] beginUpdates];
        [dataSources[index] addObject:[NSMutableArray array]];
        [tableViews[index] insertSections:[NSIndexSet indexSetWithIndex:[dataSources[index] count]-1]
                         withRowAnimation:UITableViewRowAnimationAutomatic];
        [tableViews[index] endUpdates];
    }
    else if (UITableViewCellEditingStyleDelete == editingStyle) {
        [tableViews[index] beginUpdates];
        if ([[dataSources[index] objectAtIndex:indexPath.section] count] == 0) {
            [tableViews[index] deleteSections:[NSIndexSet indexSetWithIndex:indexPath.section]
                             withRowAnimation:UITableViewRowAnimationAutomatic];
            [dataSources[index] removeObjectAtIndex:indexPath.section];
        }
        else {
            [tableViews[index] deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                                     withRowAnimation:UITableViewRowAnimationAutomatic];
            [dataSources[index] removeObjectAtIndex:indexPath.row];
        }
        [tableViews[index] endUpdates];
    }
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kMessageAddressCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *className = NSStringFromClass([MessageAddressCell class]);
    MessageAddressCell *cell = [tableView dequeueReusableCellWithIdentifier:className];
    if (cell == nil) {
        UINib *nib = [UINib nibWithNibName:className bundle:nil];
        cell = [[nib instantiateWithOwner:nil options:nil] objectAtIndex:0];
    }
    if (tableView == self.toTableView) {
        [cell.nameLabel setText:self.toList[indexPath.row]];
    }
    if (tableView == self.ccTableView) {
        [cell.nameLabel setText:self.ccList[indexPath.row]];
    }
    if (tableView == self.bccTableView) {
        [cell.nameLabel setText:self.bccList[indexPath.row]];
    }

    return cell;
}


#pragma mark DragAndDropTableViewDataSource
-(BOOL)canCreateNewSection:(NSInteger)section
{
    return YES;
}


#pragma mark - DragAndDropTableViewDelegate
-(void)tableView:(DragAndDropTableView *)tableView
willBeginDraggingCellAtIndexPath:(NSIndexPath *)indexPath
placeholderImageView:(UIImageView *)placeHolderImageView
{
    placeHolderImageView.layer.shadowOpacity = 0.3f;
    placeHolderImageView.layer.shadowRadius = 1.0f;
}

-(void)tableView:(DragAndDropTableView *)tableView
didEndDraggingCellToIndexPath:(NSIndexPath *)indexPath
 placeHolderView:(UIImageView *)placeholderImageView
{
    NSArray *dataSources = @[ self.toList, self.ccList, self.bccList, ];
    NSArray *tableViews = @[ self.toTableView, self.ccTableView, self.bccTableView, ];

    NSMutableIndexSet *indexSet = [NSMutableIndexSet indexSet];
    for (int i = 0; i < [dataSources count]; i++) {
        if ([dataSources[i] count] == 0) {
            [indexSet addIndex:i];
        }
    }

    for (NSInteger i = 0; i < [dataSources count]; i++) {
        UITableView *tv = tableViews[i];
        [tv beginUpdates];
        if (tv == tableView) {
            [tv deleteSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
            [dataSources[i] removeObjectsAtIndexes:indexSet];
        }
        [tv endUpdates];
    }
}

-(CGFloat)tableView:(DragAndDropTableView *)tableView
heightForEmptySection:(int)section
{
    return kMessageAddressCellHeight;
}


#pragma mark - event listener
- (IBAction)touchedUpInsidWithButton:(UIButton *)button
{
    //to:
    if (button == self.toButton) {
        [self designWithButton:self.toButton];
    }
    //cc:
    else if (button == self.ccButton) {
        [self designWithButton:self.ccButton];
    }
    //bcc:
    else if (button == self.bccButton) {
        [self designWithButton:self.bccButton];
    }
}


#pragma mark - api
- (void)appearInView:(UIView *)parentView
{
    // to:,cc:,bccのデザイン
    [self designWithButton:self.toButton];

    // 表示
    [super appearInView:parentView];
    CGRect endFrame = self.contentView.frame;
    // アニメーション
    self.contentView.frame = CGRectMake(self.contentView.frame.origin.x, -self.contentView.frame.size.height, self.contentView.frame.size.width, self.contentView.frame.size.height);
    [UIView animateWithDuration:0.30f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^ () { self.contentView.frame = endFrame; }
                     completion:^ (BOOL finished) {}];
}

- (void)disappear
{
    // アニメーション
    [UIView animateWithDuration:0.15f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^ () {
        self.contentView.frame = CGRectMake(self.contentView.frame.origin.x, -self.contentView.frame.size.height, self.contentView.frame.size.width, self.contentView.frame.size.height);
    }
                     completion:^ (BOOL finished) { [super disappear]; }];
}


#pragma mark - private api
/**
 * to:,cc:,bcc:の見た目を調整
 * @param selectedButton 押下されたボタン
 */
- (void)designWithButton:(FUIButton *)selectedButton
{
    [self designViewWidthWithButton:selectedButton];
    [self designButtonColorWithButton:selectedButton];
}

/**
 * to:,cc:,bcc:の幅を調整
 * @param selectedButton 押下されたボタン
 */
- (void)designViewWidthWithButton:(FUIButton *)selectedButton
{
    NSArray *buttons = @[self.toButton, self.ccButton, self.bccButton];
    NSArray *views = @[self.toView, self.ccView, self.bccView];

    // ボタンの大きさ、どのボタンが選択されているか計算
    NSInteger selectedIndex = 0;
    CGFloat minWidth = self.toView.frame.size.width;
    for (NSInteger index = 0; index < [buttons count]; index++) {
        FUIButton *button = buttons[index];
        if (button.frame.size.width < minWidth) { minWidth = ((UIView *)views[index]).frame.size.width; }
        if (button == selectedButton) { selectedIndex = index; }
    }
    CGFloat maxWidth = self.contentView.frame.size.width - minWidth * ([buttons count] - 1);

    // アニメーション
    [UIView animateWithDuration:0.15f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveLinear
                     animations:^ () {
    // 選択中のエリアだけ大きく表示
    CGFloat offsetX = 0;
    for (NSInteger index = 0; index < [views count]; index++) {
        UIView *v = views[index];
        CGRect newFrame = v.frame;
        if (index == selectedIndex) {
            newFrame = CGRectMake(offsetX, newFrame.origin.y, maxWidth, newFrame.size.height);
        }
        else {
            newFrame = CGRectMake(offsetX, newFrame.origin.y, minWidth, newFrame.size.height);
        }
        v.frame = newFrame;
        offsetX += newFrame.size.width;
    }

    }
                     completion:^ (BOOL finished) {}];
}

/**
 * to:,cc:,bccのボタンの色を調整
 * @param selectedButton
 */
- (void)designButtonColorWithButton:(FUIButton *)selectedButton
{
    NSArray *buttons = @[self.toButton, self.ccButton, self.bccButton];
    for (FUIButton *button in buttons) {
        [button setShadowHeight:4.0f];
        if (button == selectedButton) {
            [button setShadowColor:[UIColor belizeHoleColor]];
            [button setButtonColor:[UIColor peterRiverColor]];
            [button setHighlightedColor:[UIColor peterRiverColor]];
        }
        else {
            [button setShadowColor:[UIColor midnightBlueColor]];
            [button setButtonColor:[UIColor wetAsphaltColor]];
            [button setHighlightedColor:[UIColor peterRiverColor]];
        }
    }
}


@end
