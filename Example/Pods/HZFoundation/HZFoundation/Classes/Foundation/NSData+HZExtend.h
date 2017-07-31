//
//  NSData+HzExtend.h
//  ZHFramework
//
//  Created by xzh. on 15/7/26.
//  Copyright (c) 2015年 xzh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+HZExtend.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSData (HZExtend)

/**
 *  进行MD5加密
 *  
 *  @return 返回NSData类型实例
 */
- (NSData *)md5;

/**
 *  进行MD5加密
 *
 *  @return 返回NSData类型实例
 */
- (NSString *)md5String;

@end

NS_ASSUME_NONNULL_END
