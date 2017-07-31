//
//  UIViewController+HZURLManager.m
//  ZHFramework
//
//  Created by xzh. on 15/8/21.
//  Copyright (c) 2015年 xzh. All rights reserved.
//

#import "UIViewController+HZURLManager.h"
#import <HZFoundation/HZFoundation.h>
#import "HZWebViewController.h"
#import <objc/runtime.h>

static const char kOriginURL = '\0';
static const char kParams = '\1';
@interface UIViewController ()

@property(nonatomic, strong) NSString *originURL;
@property(nonatomic, strong) NSDictionary *queryDic;

@end

@implementation UIViewController (HZURLManager)
#pragma mark - Public Method
#pragma mark Core
+ (UIViewController *)viewControllerForURL:(NSURL *)url params:(NSDictionary *)params
{
    NSDictionary *config = [HZURLManageConfig sharedConfig].urlControllerConfig;
    NSAssert(config.isNoEmpty, @"请先配置URL-Ctrl-Config");
    
    NSString *scheme = url.scheme;
    
    
    if (!url || !config.isNoEmpty) return nil;
    
    /*******************根据scheme创建控制器********************/
    UIViewController *viewCtrl = nil;
    if ([scheme isEqualToString:@"http"]||[scheme isEqualToString:@"https"]) {  //scheme为http
        NSString *strWebCtrl = [HZURLManageConfig sharedConfig].classOfWebViewCtrl.isNoEmpty?[HZURLManageConfig sharedConfig].classOfWebViewCtrl:@"HZWebViewController";
        Class class = NSClassFromString(strWebCtrl);
        viewCtrl = [[class alloc] initWithURL:url];
    }else { //shchema为自定义
        NSString *strclass = [config objectForKeyPath:[NSString stringWithFormat:@"%@.%@%@",scheme,url.host,url.path]];
        NSString *errorInfo = nil;
        if(strclass.isNoEmpty) {
            Class class = NSClassFromString(strclass);
            if(NULL != class) {
                viewCtrl = [[class alloc] init];
            }else { //无该控制器
                errorInfo = [NSString stringWithFormat:@"404 :) ,%@并无该类",strclass];
            }
        }else {//无该URL
            errorInfo = [NSString stringWithFormat:@"404 :) ,%@://%@并无注册",url.scheme,url.host];
        }
        
        #ifdef DEBUG  // 调试状态
        viewCtrl = viewCtrl?:[self errorViewConrtollerWithInfo:errorInfo];
        
        #else // 发布状态
        #endif
    }
    
    if (viewCtrl) {
        NSMutableDictionary *tmpDic = [NSMutableDictionary dictionary];
        NSDictionary *urlQueryDic = url.queryDic;
        if (urlQueryDic.isNoEmpty) [tmpDic addEntriesFromDictionary:urlQueryDic];
        if (params.isNoEmpty) [tmpDic addEntriesFromDictionary:params];
        viewCtrl.params = tmpDic;
        viewCtrl.originURL = url.absoluteString;
        viewCtrl.hidesBottomBarWhenPushed = [HZURLManageConfig sharedConfig].hideBottomWhenPushed;
        return viewCtrl;
    }
    return nil;
}


+ (UIViewController *)viewControllerForURL:(NSURL *)url
{
    return [self viewControllerForURL:url params:nil];
}

#pragma mark - Private Method
/**
 *  创建错误控制器
 */
+ (UIViewController *)errorViewConrtollerWithInfo:(NSString *)errorInfo
{
    Class noCtrlClass = NSClassFromString(@"HZErrorViewController");
    UIViewController *viewCtrl = [[noCtrlClass alloc] init];
    [viewCtrl setValue:errorInfo forKey:@"errorInfo"];
    return viewCtrl;
}

#pragma mark - Property
- (NSString *)originURL
{
    return objc_getAssociatedObject(self, &kOriginURL);
}

- (void)setOriginURL:(NSString *)originURL
{
    NSString *url = objc_getAssociatedObject(self, &kOriginURL);
    if (url != originURL) {
        [self willChangeValueForKey:@"originURL"];
        objc_setAssociatedObject(self, &kOriginURL, originURL, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self didChangeValueForKey:@"originURL"];
    }
}

- (NSDictionary *)params
{
    return objc_getAssociatedObject(self, &kParams);
}

- (void)setParams:(NSDictionary *)params
{
    NSDictionary *dic = objc_getAssociatedObject(self, &kParams);
    if (dic != params) {
        [self willChangeValueForKey:@"params"];
        objc_setAssociatedObject(self, &kParams, params, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [self didChangeValueForKey:@"params"];
    }
}


@end
