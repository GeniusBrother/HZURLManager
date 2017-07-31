//
//  NSDictionary+HZExtend.h
//  ZHFramework
//
//  Created by xzh. on 15/7/26.
//  Copyright (c) 2015年 xzh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+HZExtend.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (HZExtend)

/**
 *  获取字典元素
 *  如果字典有多个层级，通过.来组合key,如 @{ @“person”:@{@"name":@"GeniusBrotherHZExtend"}} 则可以通过person.name 来获取GeniusBrotherHZExtend
 */
- (nullable id)objectForKeyPath:(NSString *)keyPath;

/**
 *  不存在,则返回other
 */
- (nullable id)objectForKeyPath:(NSString *)path otherwise:(NSObject *)other;

/**
 *  获取integer元素
 *  确保元素存在时使用
 */
- (NSInteger)integerValueForKeyPath:(NSString *)keyPath;

/**
 *  获取double元素
 *  确保元素存在时使用
 */
- (double)doubleValueForKeyPath:(NSString *)keyPath;

/**
 *  获取bool元素
 *  确保元素存在时使用
 */
- (BOOL)boolValueForKeyPath:(NSString *)keyPath;


/**
 *	将字典装换成查询字符串
 *
 *	@return 返回简单的查询字符串如:name=xzh&age=21,如果自身为空，则返回nil
 */
- (nullable NSString *)keyValueString;

/**
 *	将字典装换成json字符串
 */
- (NSString *)jsonString;


@end

NS_ASSUME_NONNULL_END
