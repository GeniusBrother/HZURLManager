//
//  UIViewController+HZURLManager.h
//  ZHFramework
//
//  Created by xzh. on 15/8/21.
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

#import <UIKit/UIKit.h>
#import "HZURLManageConfig.h"
/**
 *  根据URL生成控制器
 */
@interface UIViewController (HZURLManager)

/**
 *  传入URL来生成对应的控制器,可以作为页面的标识
 */
@property(nonatomic, strong, readonly) NSString *originURL;

/**
 *  由查询字符串和跳转时传入的NSDictionary组成
 */
@property(nonatomic, strong, readonly) NSDictionary *queryDic;

/**
 *  根据URL(schema://abc?k=v)获得对应的控制器
 *  queryDic到时候可通过控制器的queryDic属性获得
 */
+ (UIViewController *)viewControllerWithString:(NSString *)urlstring;
+ (UIViewController *)viewControllerWithString:(NSString *)urlstring queryDic:(NSDictionary *)queryDic;

@end
