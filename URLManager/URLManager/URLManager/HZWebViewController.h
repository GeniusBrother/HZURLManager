//
//  HZWebViewController.h
//  ZHFramework
//
//  Created by xzh. on 15/8/24.
//  Copyright (c) 2015年 xzh. All rights reserved.
//  项目网址:https://github.com/GeniusBrother/HZURLManager
//
//  结合MVVM以及MVC优点的架构HZExtend:https://github.com/GeniusBrother/HZExtend
//  项目特点
//  1.解放VC:基于MVVM的思想，将数据处理放入ViewModel里从而减少控制器的压力，降低代码耦合.
//  2.网络请求:基于AFN自定义了贴切业务逻辑的网络请求框架.
//  3.缓存体系:基于TMCache定制与业务逻辑相符的缓存体系.
//  4.数据元组:基于FMDB实现了与表元组对应的数据模型.
//  5.URLManager:支持URL跳转
//  6.一些常用的基础类扩展.

#import "HZViewController.h"
@interface HZWebViewController : HZViewController

@property(nonatomic, strong, readonly) UIWebView *webView;
@property(nonatomic, strong, readonly) NSURL *URL;

- (instancetype)initWithURL:(NSURL *)URL;

/**
 *  子类重写来回调
 */
-(void)webViewIsloading;    //加载中调用
-(void)webViewIsSuccess;    //加载成功调用
-(void)webViewIsFail;       //加载失败调用

@end
