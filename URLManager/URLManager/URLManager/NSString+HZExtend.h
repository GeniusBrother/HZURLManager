//
//  NSString+HZExtend.h
//  ZHFramework
//
//  Created by xzh. on 15/7/20.
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
#import "NSObject+HZExtend.h"
@interface NSString (HZExtend)

/**
 *  以md5算法加密
 */
- (NSString *)md5;

/************查询字符串************/
- (NSString *)urlEncode;
- (NSString *)urlDecode;
/**
 *  以https://github.com/GeniusBrother/HZExtend?author=GeniusBrother为例
 */
- (NSString *)scheme;   //https
- (NSString *)host; //github.com
- (NSString *)allPath;  //https://github.com/GeniusBrother/HZExtend
- (NSString *)path; ///GeniusBrother/HZExtend
- (NSString *)keyValues;    //author=GeniusBrother
- (NSDictionary *)queryDic; //@{@"author":@"GeniusBrother"}

@end
