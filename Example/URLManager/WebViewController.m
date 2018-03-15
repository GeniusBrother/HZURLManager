//
//  WebViewController.m
//  URLManager
//
//  Created by xzh on 2017/8/11.
//  Copyright © 2017年 GeniusBrother. All rights reserved.
//

#import "WebViewController.h"
#import <HZURLManager/HZURLManager.h>
#import <HZFoundation/HZFoundation.h>
#import <WebKit/WebKit.h>
@interface WebViewController ()<WKNavigationDelegate>

@property(nonatomic, weak) WKWebView *webView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *urlstring = [[self.params objectForKey:@"url"] urlDecode];
    NSURL *url = [NSURL URLWithString:urlstring];
    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    webView.navigationDelegate = self;
    [self.view addSubview:webView];
    self.webView = webView;
    
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    
}



@end
