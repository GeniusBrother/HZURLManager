//
//  ViewController.m
//  URLManager
//
//  Created by xzh on 16/2/29.
//  Copyright © 2016年 GeniusBrother. All rights reserved.
//

#import "ViewController.h"
#import "HZURLManager.h"
#import "NSString+HZExtend.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self loadSubViews];
    
    //I don't recommend load URLManager Config in View Controller, you should load it in AppDelegate.
    [self loadConfig];
}

#pragma mark - Config
- (void)loadConfig
{
    //Loads URL-Controller & URL-Method Config.
    [[HZURLManagerConfig sharedConfig] loadURLCtrlConfig:[[NSBundle mainBundle] pathForResource:@"URL-Controller-Config" ofType:@"plist"] urlMethodConfig:[[NSBundle mainBundle] pathForResource:@"URL-Method-Config" ofType:@"plist"]];
    
    //Adds URL Rewrite rule. You may be get the rule from remote.
    [[HZURLManagerConfig sharedConfig] addRewriteRules:@[@{@"match":@"(?:https://)?www.hz.com/articles/(\\d)\\?(.*)",@"target":@"hz://page/article?$query&id=$1"}]];
}

#pragma mark - Action
- (void)btnClick:(UIButton *)sender
{
    NSInteger tag = sender.tag;
    
    if (0 == tag) { //URL-Present
        [URL_MANAGERN redirectToURL:@"hz://page/article?title=present" animated:YES parmas:nil options:@{HZRedirectPresentMode:@(YES)} completion:nil];
    }else if (1 == tag) { //URL-Push
        //The following URL will be converted to hz://page/article by rewriting.
        [URL_MANAGERN pushToURL:@"https://www.hz.com/articles/3?title=push" animated:YES];
    }else if (2 == tag) {   
        NSString *targetUrl = @"https://github.com/GeniusBrother/HZExtend";
        NSString *url = [NSString stringWithFormat:@"hz://page/web?url=%@",[targetUrl urlEncode]];
        [URL_MANAGERN pushToURL:url animated:YES];
    }else if (3 == tag) {   //URL-Action
        [URL_MANAGERN handleURL:@"hz://urlmanger.kit/doAlert?title=alert&message=URL-showAlert" withParams:nil];
    }else if (4 == tag) {   //URL-NoRegister
        //跳转到没有注册过的控制器时在开发环境会提示错误
        [URL_MANAGERN pushToURL:@"hz://urlItemC?title=push" animated:YES];
    }
}

#pragma mark - UI
- (void)loadSubViews
{
    CGFloat viewWidth = self.view.frame.size.width;
    CGFloat btnWidth = 200;
    CGFloat btnHeight = 30;
    
    NSArray *titles = @[@"URL-Present",@"URL-Push",@"Default-Http(s)-URL",@"URL-Method",@"URL-NoRegister"];
    for (NSInteger idx = 0; idx<titles.count; idx++) {
        UIButton *URLBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        URLBtn.frame = CGRectMake((viewWidth - btnWidth)/2, 100 + idx*(20+btnHeight), btnWidth, btnHeight);
        URLBtn.tag = idx;
        [URLBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [URLBtn setTitle:titles[idx] forState:UIControlStateNormal];
        [URLBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        URLBtn.backgroundColor = [UIColor brownColor];
        [self.view addSubview:URLBtn];
    }
}
@end
