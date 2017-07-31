//
//  HZURLManageConfig.m
//  HZNetworkDemo
//
//  Created by xzh on 16/2/27.
//  Copyright © 2016年 xzh. All rights reserved.
//

#import "HZURLManageConfig.h"
#import <HZFoundation/HZFoundation.h>
@interface HZURLManageConfig ()

@property(nonatomic, copy) NSDictionary *urlControllerConfig;

@property(nonatomic, copy) NSDictionary *urlMethodConfig;

@property(nonatomic, strong) NSMutableArray *mutableRewriteRule;

@end

@implementation HZURLManageConfig
#pragma mark - Initialization
singleton_m
+ (instancetype)sharedConfig
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

- (instancetype)init
{
    self = [super init];
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _hideBottomWhenPushed = YES;
        _mutableRewriteRule = [NSMutableArray array];
    });
    return self;
}

#pragma mark - Public Method
- (void)loadURLCtrlConfig:(NSString *)ctrlPath urlMethodConfig:(NSString *)methodPath
{
    if (ctrlPath.isNoEmpty) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:ctrlPath]) {
            self.urlControllerConfig = [NSDictionary dictionaryWithContentsOfFile:ctrlPath];
        }else {
            NSAssert(NO, @"ctrlPath should be a file path");
        }
    }
    
    if (methodPath.isNoEmpty) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:methodPath]) {
            self.urlMethodConfig = [NSDictionary dictionaryWithContentsOfFile:methodPath];
        }else {
            NSAssert(NO, @"methodPath should be a file path");
        }
    }
}

- (void)addRewriteRules:(NSArray *)rule
{
    if (rule.isNoEmpty) [self.mutableRewriteRule addObjectsFromArray:rule];
}


#pragma mark - Getter
- (NSArray *)rewriteRule
{
    return [self.mutableRewriteRule copy];
}

@end
