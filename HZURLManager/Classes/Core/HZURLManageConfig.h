//
//  HZURLManageConfig.h
//  HZNetworkDemo
//
//  Created by xzh on 16/2/27.
//  Copyright © 2016年 xzh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <HZFoundation/HZSingleton.h>
/**
 *  URLManager中的数据配置器
 */
@interface HZURLManageConfig : NSObject
singleton_h(Config)

/** URL-Ctrl配置字典 **/
@property(nonatomic, readonly) NSDictionary *urlControllerConfig;

/** URL-Method配置字典 **/
@property(nonatomic, readonly) NSDictionary *urlMethodConfig;

/** URL重写规则数组 **/
@property(nonatomic, readonly) NSArray *rewriteRule;

/**
 *  配置http所对应的Ctrl名称
 */
@property(nonatomic, strong) NSString *classOfWebViewCtrl;

/**
 *  使用URLManager跳转时，指定下bar是否隐藏,默认YES
 */
@property(nonatomic, assign) BOOL hideBottomWhenPushed;

/**
 *	加载URLController和URLMethod配置
 *
 *	@param ctrlPath URL-Controller-Config.plist文件的路径
 *  @param methodPath URL-Method-Config.plist文件的路径
 */
- (void)loadURLCtrlConfig:(NSString *)ctrlPath urlMethodConfig:(NSString *)methodPath;

/**
 *	添加重写规则
 *
 *	@param rule 重写规则,规则形式见文档
 */
- (void)addRewriteRules:(NSArray *)rule;

@end
