//
//  URLItemViewController.m
//  URLManager
//
//  Created by xzh on 16/2/29.
//  Copyright © 2016年 GeniusBrother. All rights reserved.
//

#import "URLItemViewController.h"
#import "HZURLManager.h"
@interface URLItemViewController ()

@end

@implementation URLItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = [self.params objectForKey:@"title"];
    self.view.backgroundColor = [UIColor brownColor];
    
    CGFloat viewWidth = self.view.frame.size.width;
    CGFloat viewHeight = self.view.frame.size.height;
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
            titleLabel.text = @"项目网址:https://github.com/GeniusBrother/HZURLManager\n\nHZExtend:结合MVVM以及MVC优点的架构:\nhttps://github.com/GeniusBrother/HZExtend\n项目特点\n\n1.解放VC:基于MVVM的思想，将数据处理放入ViewModel里从而减少控制器的压力，降低代码耦合.\n\n2.网络请求:基于AFN自定义了贴切业务逻辑的网络请求框架.\n\n3.缓存体系:基于TMCache定制与业务逻辑相符的缓存体系.\n\n4.数据元组:基于FMDB实现了与表元组对应的数据模型.\n\n5.URLManager:支持URL跳转\n\n6.一些常用的基础类扩展.";
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.font = [UIFont systemFontOfSize:13];
    titleLabel.backgroundColor = [UIColor redColor];
    [self.view addSubview:titleLabel];
    
}

- (void)btnClick:(UIButton *)sender
{
    [HZURLManager dismissCurrentAnimated:YES];
}



@end
