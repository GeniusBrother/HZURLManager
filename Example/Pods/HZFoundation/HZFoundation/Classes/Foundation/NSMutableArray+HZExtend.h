//
//  NSMutableArray+HZExtend.h
//  HZNetworkDemo
//
//  Created by xzh on 16/2/1.
//  Copyright © 2016年 xzh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+HZExtend.h"

NS_ASSUME_NONNULL_BEGIN

typedef NSComparisonResult	(^NSMutableArrayCompareBlock)(id left, id right);


@interface NSMutableArray (HZExtend)

/**
 *  移除数组元素
 *  若下标越界时,则什么也不做
 */
- (void)safeRemoveObjectAtIndex:(NSInteger)index;

/**
 *	添加不重复的元素
 *
 *	@param object  元素
 *  @param compare 指定比较的方式,基本数据类型可以传递nil
 */
- (void)addUniqueObject:(id)object compare:(NSMutableArrayCompareBlock)compare;

@end

@interface NSMutableArray (HZDeprecated)

- (void)appendPageArray:(NSArray *)pageArray pageNumber:(NSInteger)currentPageNumber pageSize:(NSInteger)pageSize __deprecated_msg("已经废弃");

- (void)removeDataForPage:(NSInteger)page pageSize:(NSInteger)pageSize __deprecated_msg("已经废弃");

@end

NS_ASSUME_NONNULL_END
