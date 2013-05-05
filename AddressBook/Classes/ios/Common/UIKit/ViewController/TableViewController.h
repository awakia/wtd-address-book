//  Created by Kenzan Hase
//  Copyright (c) Kenzan Hase. All rights reserved.


#pragma mark - interface
/// TableViewController
@interface TableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
}


#pragma mark - property
/// tableview
@property (nonatomic, weak) IBOutlet UITableView *tableView;

/// tableviewcellのリスト
@property (strong) NSMutableArray *tableList;


@end
