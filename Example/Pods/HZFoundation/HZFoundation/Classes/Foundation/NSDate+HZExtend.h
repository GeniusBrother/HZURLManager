//
//  NSDate+HZExtend.h
//  Pods
//
//  Created by xzh on 2017/2/17.
//
//
//yyyy-MM-dd HH:mm:ss
#import <Foundation/Foundation.h>

#define CURRENT_CALENDAR [NSCalendar currentCalendar]

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (HZExtend)

/** 获取时间戳 **/
@property(nonatomic, readonly) NSUInteger timeStamp;

/**
 *  将格式化字日期字符串转换为date
 *
 *  @param date 格式化日期字符串 如 2017-01-01
 *
 *  @return NSDate类型实例
 */
+ (NSDate *)dateForFormatterDate:(NSString *)date;

/**
 *  获取今天date
 */
+ (NSDate *)today;

/**
 *  获取当前时间戳
 */
+ (NSUInteger)timeStamp;

/**
 *	获取当前年
 */
+ (NSInteger)currentYear;


/**
 *  判断date是否为今天之内
 */
- (BOOL)isInToday;

/**
 *  判断date是否为昨天之内
 */
- (BOOL)isInYesterday;

/**
 *  判断date是否为明天之内
 */
- (BOOL)isInTomorrow;

/**
 *  判断date是否为本周之内
 */
- (BOOL)isInThisWeek;

/**
 *  判断date是否为本月之内
 */
- (BOOL)isInThisMonth;

/**
 *  判断date是否为本年之内
 */
- (BOOL)isInThisYear;

/**
 *  获取格式化日期 如2017-01-01
 *  
 *  @return NSString类型实例
 */
- (NSString *)formattedDateWithSeparator:(NSString *)separator;

/**
 *  获取格式化时间 如08:08
 *
 *  @return NSString类型实例
 */
- (NSString *)formattedTimeWithSeparator:(NSString *)separator;

@end

NS_ASSUME_NONNULL_END
