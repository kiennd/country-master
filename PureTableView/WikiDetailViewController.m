//
//  WikiDetailViewController.m
//  PureTableView
//
//  Created by KIENND on 5/2/13.
//  Copyright (c) 2013 TechMaster. All rights reserved.
//

#import "WikiDetailViewController.h"

@interface WikiDetailViewController ()
{
   NSString* _urlString;
}
@end

@implementation WikiDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
URL: (NSString *) urlString
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _urlString = urlString;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _bar.title = self.title;
    NSURL *homeURL = [NSURL URLWithString:_urlString];
    NSLog(@"%@",_urlString);
	NSURLRequest *request = [[NSURLRequest alloc] initWithURL:homeURL];
    [_webView loadRequest:request];
    
    //Start loading the webview's request
	
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)backSelector:(id)sender {
    NSLog(@"Presenting view controller %@", self.presentingViewController);
    [self dismissViewControllerAnimated: YES completion:^{
        NSLog(@"Dismiss complete");
    }];
    
}


@end
