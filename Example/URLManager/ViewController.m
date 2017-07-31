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
    
    CGFloat viewWidth = self.view.frame.size.width;
    CGFloat viewHeight = self.view.frame.size.height;
    UIButton *pageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    pageBtn.frame = CGRectMake((viewWidth -150)/2, (viewHeight-30)/2, 150, 30);
    [pageBtn addTarget:self action:@selector(push:) forControlEvents:UIControlEventTouchUpInside];
    [pageBtn setTitle:@"URL-Push" forState:UIControlStateNormal];
    [pageBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    pageBtn.backgroundColor = [UIColor brownColor];
    [self.view addSubview:pageBtn];
    
    
    UIButton *dbBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    dbBtn.frame = CGRectMake((viewWidth -150)/2, (viewHeight-30)/2+40, 150, 30);
    [dbBtn addTarget:self action:@selector(present:) forControlEvents:UIControlEventTouchUpInside];
    [dbBtn setTitle:@"URL-Present" forState:UIControlStateNormal];
    [dbBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    dbBtn.backgroundColor = [UIColor brownColor];
    [self.view addSubview:dbBtn];
    
    UIButton *errorBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    errorBtn.frame = CGRectMake((viewWidth -150)/2, (viewHeight-30)/2+80, 150, 30);
    [errorBtn addTarget:self action:@selector(noRegister:) forControlEvents:UIControlEventTouchUpInside];
    [errorBtn setTitle:@"URL-NoRegister" forState:UIControlStateNormal];
    [errorBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    errorBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:errorBtn];
    
}

- (void)push:(UIButton *)sender
{
    //push hz://page.hz/article 到对应的控制器,并传入参数title=push
     [URL_MANAGERN redirectToURL:@"https://www.hz.com/articles/3?start=1&offset=20" animated:YES];
}

- (void)present:(UIButton *)sender
{
    //push hz://urlItemB 到对应的控制器,并传入参数title=present
    [URL_MANAGERN redirectToURL:@"https://www.hz.com/articles/3?start=1&offset=20" animated:YES parmas:nil options:@{@"HZRedirectPresentMode":@(YES)} completion:nil];
}

- (void)noRegister:(UIButton *)sender
{
    //push没有注册过的控制器或链接在开发环境会提示错误
    [HZURLManager pushViewControllerWithString:@"hz://urlItemC?title=push" animated:YES];
}

@end
