//
//  HZURLNavigation.h
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

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Singleton.h"

/**
 *  负责跳转,获得当前viewCtrl&navgationController
 */
@interface HZURLNavigation : NSObject
singleton_h(Navigation)
/**
 *  获得当前的控制器,从rootViewCtrl开始寻找
 */
+ (UIViewController *)currentViewController;

/**
 *  获得当前的navgationCtrl
 */
+ (UINavigationController *)currentNavigationViewController;

/**
 *  将viewController push到当前的导航控制器,若当前导航控制器为nil则什么也不做
 */
+ (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;
+ (void)pushViewControllerArray:(NSArray *)viewControllers animated:(BOOL)animated;

/**
 *  replace:YES 用viewController取代visibleViewController
 */
+ (void)pushViewControllerArray:(NSArray *)viewControllers animated:(BOOL)animated replace:(BOOL)replace;

/**
 *  将viewController present到当前的控制器上
 */
+ (void)presentViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(void (^ __nullable)(void))completion;

/** 
 *  1.若当前控制器的容器为导航控制器,则pop
 *  2.若当前控制器为模态视图控制器,则dismiss
 */
+ (void)dismissCurrentAnimated:(BOOL)animated;

@end
