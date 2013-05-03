//
//  WikiDetailViewController.h
//  PureTableView
//
//  Created by KIENND on 5/2/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WikiDetailViewController : UIViewController <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
                  URL: (NSString *) urlString;
@property (weak, nonatomic) IBOutlet UINavigationItem *bar;
@end
