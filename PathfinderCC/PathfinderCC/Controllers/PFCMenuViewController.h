//
//  PFCMenuViewController.h
//  PathfinderCC
//
//  Created by Amanda Chappell on 10/29/13.
//  Copyright (c) 2013 Amanda Chappell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PFCMenuViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end
