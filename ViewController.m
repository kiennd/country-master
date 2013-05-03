//
//  ViewController.m
//  PureTableView
//
//  Created by techmaster on 5/2/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "ViewController.h"
#define COUNTRY_KEY @"countries"
#define HEADER_KEY @"header"
@interface ViewController ()
{
    NSArray *_data;
    NSMutableArray* _countries;
}
@end

@implementation ViewController

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
    {
        [self loadData];
       
    }
    return self;
}

- (void) loadView
{
    [super loadView];
    NSArray *item = [[NSArray alloc] initWithObjects:@"By name",@"By pop", nil];
    _segment  = [[UISegmentedControl alloc] initWithItems:item];

    _segment.frame = CGRectMake(0, 0, 50, 30);
    _segment.segmentedControlStyle = UISegmentedControlStylePlain;
    [_segment addTarget:self action:@selector(sortAc:) forControlEvents:UIControlEventValueChanged];
    UIBarButtonItem* segment = [[UIBarButtonItem alloc] initWithCustomView:(UIView *)_segment];
    [self setToolbarItems:[NSArray arrayWithObjects:segment, nil]];
   // [self.view addSubview:_segment];
}

- (void) loadData{
    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
    _data = [NSArray arrayWithContentsOfFile:dataPath];
    _countries = [[NSMutableArray alloc] initWithObjects: nil];
    for (int i=0; i<[_data count]; i++) {
        [_countries addObject:[_data[i] valueForKey:COUNTRY_KEY]];
    }    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //_segm addT
	// Do any additional setup after loading the view.
}

#pragma mark UITableViewDelegate

#pragma mark UITableViewDataSource
// return number section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
     return [_data count];
}

// return number of row in section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_countries[section] count];
}

// return title section
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [_data[section] valueForKey:HEADER_KEY];
    
}

// init cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"UniqueID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: cellID];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    NSArray *countries = _countries[indexPath.section] ;
    
    cell.textLabel.text = countries[indexPath.row][@"name"];
    cell.detailTextLabel.text = countries[indexPath.row][@"pop"];
    cell.imageView.image = [UIImage imageNamed: [NSString stringWithFormat:@"%@.png",countries[indexPath.row][@"name"] ]];
    return cell;
}
- (void)sortAc:(id)sender {
    UISegmentedControl *segmentedControl = (UISegmentedControl *)sender;

	if ([segmentedControl selectedSegmentIndex] == 0) {
        NSLog(@"select 0");
        
        for (int i=0; i< [_data count]; i++) {
           _countries[i] = [_countries[i] sortedArrayUsingComparator:^NSComparisonResult(NSDictionary* obj1, NSDictionary* obj2) {
                
                return [obj1[@"name"] compare:obj2[@"name"]];
                
            }];
            
        }

        [_tableView reloadData];
    }else{
        NSLog(@"select 1");
        
        for (int i=0; i< [_data count]; i++) {
            _countries[i] = [_countries[i] sortedArrayUsingComparator:^NSComparisonResult(NSDictionary* obj1, NSDictionary* obj2) {
                return [obj1[@"pop"] floatValue]  > [obj2[@"pop"] floatValue];
            }];
            
        }
        [_tableView reloadData];

    }

}
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
        NSLog(@"%d  %d",indexPath.row,indexPath.section);
    NSString* nameCountry = _countries[indexPath.section][indexPath.row][@"name"];
    NSLog(@"%@",nameCountry);
    WikiDetailViewController* detailVC = [[WikiDetailViewController alloc] initWithNibName:@"WikiDetailViewController" bundle:nil URL:[NSString stringWithFormat:@"https://en.wikipedia.org/wiki/%@",nameCountry]];
    detailVC.title = nameCountry;
    [self presentViewController:detailVC animated:YES completion:^{
        NSLog(@"Presented View Controller is %@", self.presentedViewController);
    }];
    
    //[self.navigationController pushViewController:detailVC animated:YES];
    
}



@end
