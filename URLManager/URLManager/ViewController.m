//
//  ViewController.m
//  URLManager
//
//  Created by xzh on 16/2/29.
//  Copyright © 2016年 GeniusBrother. All rights reserved.
//

#import "ViewController.h"
#import "HZURLManager.h"
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
}

- (void)push:(UIButton *)sender
{
    //push hz://urlItemB 到对应的控制器,并传入参数title=push
    [HZURLManager pushViewControllerWithString:@"hz://urlItemB?title=push" animated:YES];
}

- (void)present:(UIButton *)sender
{
    //push hz://urlItemB 到对应的控制器,并传入参数title=present
    [HZURLManager presentViewControllerWithString:@"hz://urlItemB?title=present" animated:YES completion:nil];
}

@end
