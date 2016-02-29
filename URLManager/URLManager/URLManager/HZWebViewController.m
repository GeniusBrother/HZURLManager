//
//  HZWebViewController.m
//  ZHFramework
//
//  Created by xzh. on 15/8/24.
//  Copyright (c) 2015年 xzh. All rights reserved.
//

#import "HZWebViewController.h"
#import "UIViewController+HZURLManager.h"
#import "NSObject+HZExtend.h"
@interface HZWebViewController ()<UIWebViewDelegate>
@property(nonatomic, strong) UIWebView *webView;
@property(nonatomic, strong) NSURL *URL;
@end

@implementation HZWebViewController

- (instancetype)initWithURL:(NSURL *)URL
{
    self = [super init];
    if (self) {
        _URL = URL;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *title = [self.queryDic objectForKey:@"title"];
    if (title.isNoEmpty) {
        self.title = title;
    }
    
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    _webView.delegate = self;
    [self.view addSubview:_webView];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.URL]];
}

#pragma mark - UIWebViewDelegate
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self webViewIsloading];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    if (!self.title.isNoEmpty)
    self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    
    [self webViewIsSuccess];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self webViewIsFail];
}

#pragma mark - CallBack
- (void)webViewIsloading
{
    //提示加载中
}

- (void)webViewIsSuccess
{
    //提示加载成功
}

- (void)webViewIsFail
{
    //提示加载失败
}
@end
