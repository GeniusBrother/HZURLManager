//
//  URLItemViewController.m
//  URLManager
//
//  Created by xzh on 16/2/29.
//  Copyright © 2016年 GeniusBrother. All rights reserved.
//

#import "URLItemViewController.h"
#import <HZURLManager/HZURLManager.h>
@interface URLItemViewController ()

@end

@implementation URLItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = [self.params objectForKey:@"title"];
    self.view.backgroundColor = [UIColor brownColor];
    
    CGFloat viewWidth = self.view.frame.size.width;
    UIButton *pageBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    pageBtn.frame = CGRectMake((viewWidth -150)/2, 100, 150, 30);
    [pageBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [pageBtn setTitle:@"点击返回" forState:UIControlStateNormal];
    [pageBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    pageBtn.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:pageBtn];
    
    if ([self.title isEqualToString:@"push"]) {
        UILabel *tipLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        tipLabel.frame = CGRectMake((viewWidth -300)/2, 145, 300, 30);
        tipLabel.text = @"自定义导航控制器,可以全屏侧滑返回";
        tipLabel.textColor = [UIColor blackColor];
        tipLabel.textAlignment = NSTextAlignmentCenter;
        tipLabel.font = [UIFont systemFontOfSize:16];
        tipLabel.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:tipLabel];
    }
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 180, self.view.frame.size.width, 350)];
    titleLabel.numberOfLines = 0;
    titleLabel.text = @"项目网址:https://github.com/GeniusBrother/HZURLManager\n\nHZExtend is a collection of iOS components.\nIt consists of the following several independent components:\n\n* HZFoundation — A set of useful categories for Foundation and UIKit.\n *HZURLManager — URL routing library for iOS, support URL rewrite.\n *HZNetwork — A useful networking framework based on AFNetworking for iOS, OS X, watchOS, and tvOS.";
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.font = [UIFont systemFontOfSize:13];
    titleLabel.backgroundColor = [UIColor redColor];
    [self.view addSubview:titleLabel];
    
}

- (void)btnClick:(UIButton *)sender
{
    [HZURLNavigation dismissCurrentAnimated:YES];
}



@end
