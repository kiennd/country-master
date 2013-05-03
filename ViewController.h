//
//  ViewController.h
//  PureTableView
//
//  Created by techmaster on 5/2/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WikiDetailViewController.h"
@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong) UISegmentedControl* segment;
@end
