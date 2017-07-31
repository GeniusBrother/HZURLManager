//
//  UIViewController+HZURLManager.h
//  ZHFramework
//
//  Created by xzh. on 15/8/21.
//  Copyright (c) 2015年 xzh. All rights reserved.
//  根据URL创建控制器

#import <UIKit/UIKit.h>
#import "HZURLManageConfig.h"
@interface UIViewController (HZURLManager)

/**
 *  控制器所对应的URL
 */
@property(nonatomic, strong, readonly) NSString *originURL;

/**
 *  由查询字符串和跳转时传入的NSDictionary组成
 */
@property(nonatomic, strong, readonly) NSDictionary *params;

/**
 *  获取URL所对应的控制器
 *  params到时候可通过控制器的params属性获得
 */
+ (UIViewController *)viewControllerForURL:(NSURL *)url;
+ (UIViewController *)viewControllerForURL:(NSURL *)url params:(NSDictionary *)params;

@end
