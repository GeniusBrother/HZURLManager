//
//  NSArray+HzExtend.h
//  ZHFramework
//
//  Created by xzh. on 15/7/20.
//  Copyright (c) 2015年 xzh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+HZExtend.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (HZExtend)

/**
 *	获取数组元素, 若越界返回nil
 *
 *	@param index 数组下标
 *
 *  @return 数组元素
 */
- (nullable id)objectAtSafeIndex:(NSInteger)index;

/**
 *  获取倒序数组
 */
- (NSArray *)reversedArray;

/**
 *	将数组转换成json字符串
 */
- (NSString *)jsonString;

@end

NS_ASSUME_NONNULL_END
