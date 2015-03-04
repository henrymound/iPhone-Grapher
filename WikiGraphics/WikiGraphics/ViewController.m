//
//  ViewController.m
//  WikiGraphics
//
//  Created by Henry O Mound on 2/23/15.
//  Copyright (c) 2015 Henry Mound. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>

@interface ViewController ()

@end

@implementation ViewController

@synthesize NewGraphButton = _NewGraphButton, NewGraphTitle = _NewGraphTitle, AddWidget = _AddWidget, TitleBar = _TitleBar;

CGRect screenBound;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Basic application information variables
    screenBound = [[UIScreen mainScreen] bounds];
    
    //Create NewGraphicButton
    _NewGraphButton.center = CGPointMake(screenBound.size.width/2, screenBound.size.height/2);
    NSLog(@"%f, %f", screenBound.size.width, screenBound.size.height);
    _NewGraphButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_NewGraphButton addTarget:self action:@selector(NewGraphButton:)
     forControlEvents:UIControlEventTouchUpInside];
    [_NewGraphButton setTitle:@"New Graph" forState:UIControlStateNormal];
    _NewGraphButton.frame = CGRectMake(screenBound.size.width/2 - 50, screenBound.size.height/2 - 25, 100, 50.0);

    _TitleBar.frame = CGRectMake(0, 0, screenBound.size.width, 100);
    //Add elements to screen
    [self.view addSubview:_NewGraphButton];
}

- (IBAction)NewGraphButton:(id)sender {
    [_NewGraphButton removeFromSuperview];
    
    _AddWidget = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _AddWidget.frame = CGRectMake(_NewGraphButton.frame.origin.x, _NewGraphButton.frame.origin.y - 200, 100, 50.0);
    [_AddWidget addTarget:self action:@selector(AddWidget:)
              forControlEvents:UIControlEventTouchUpInside];
    [_AddWidget setTitle:@"Add Widget" forState:UIControlStateNormal];
    [self.view addSubview:_AddWidget];
    
}


- (IBAction)AddWidget:(id)sender{
    
    UIWebView *webview=[[UIWebView alloc]initWithFrame:CGRectMake(0, 100, screenBound.size.width, screenBound.size.width)];

    webview.scrollView.scrollEnabled = NO;
    webview.scrollView.bounces = NO;
    webview.dataDetectorTypes = UIDataDetectorTypeNone;
    NSURL *nsurl = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"charts/samples/line" ofType:@"html"] isDirectory:NO];
    NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
    
    [webview loadRequest:nsrequest];
    [self.view addSubview:webview];
    
    NSString *message = [NSString stringWithFormat:@"Added graph from %@",
                         [nsurl path]];
    NSLog(@"%@", message);


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
