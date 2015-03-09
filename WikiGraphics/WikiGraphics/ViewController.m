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
    while (self.view.gestureRecognizers.count) {
        [self.view removeGestureRecognizer:[self.view.gestureRecognizers objectAtIndex:0]];
    }
    
    
}

- (IBAction)NewGraphButton:(id)sender {
   
    UIWebView *webview=[[UIWebView alloc]initWithFrame:CGRectMake(0, 20, screenBound.size.width, screenBound.size.height)];
    
<<<<<<< Updated upstream
    webview.scrollView.bounces = NO;
    webview.scrollView.scrollEnabled = TRUE;
    webview.dataDetectorTypes = UIDataDetectorTypeNone;
    NSURL *nsurl = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"charts/samples/graphCard" ofType:@"html"] isDirectory:NO];
    NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
    NSString * jsCallBack = @"window.getSelection().removeAllRanges();document.documentElement.style.webkitUserSelect='none';document.body.style.setProperty(\"-webkit-tap-highlight-color\", \"rgba(0,0,0,0)\");";//Disables user selection
    [webview stringByEvaluatingJavaScriptFromString:jsCallBack];
    [webview loadRequest:nsrequest];

  //  [webview stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitTouchCallout='none';"];

    [self.view addSubview:webview];
=======
    UIWebView *webview=[[UIWebView alloc]initWithFrame:CGRectMake(0, 100, screenBound.size.width, screenBound.size.width)];
//
//    webview.scrollView.scrollEnabled = NO;
//    webview.scrollView.bounces = NO;
//    webview.dataDetectorTypes = UIDataDetectorTypeNone;
//    NSURL *nsurl = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"charts/samples/line" ofType:@"html"] isDirectory:NO];
//    NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
//    
//    [webview loadRequest:nsrequest];
//    [self.view addSubview:webview];
//    
//    NSString *message = [NSString stringWithFormat:@"Added graph from %@",
//                         [nsurl path]];
//    NSLog(@"%@", message);
    

    
    NSString* url = @"http://infobeautiful3.s3.amazonaws.com/2014/11/1276_Codebases.png";
    
    NSURL* nsUrl = [NSURL URLWithString:url];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:nsUrl cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:30];
    
    [webview loadRequest:request];
>>>>>>> Stashed changes
    

}

//Disables copy and paste in UIWebView


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(copy:) ||
        action == @selector(paste:)||
        action == @selector(cut:))
    {
        return false;
    }
    return [super canPerformAction:action withSender:sender];
}

@end
