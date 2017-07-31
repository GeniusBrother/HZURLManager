//
//  NSObject+HZURLHandler.m
//  Pods
//
//  Created by xzh on 2017/7/31.
//
//

#import "NSObject+HZURLHandler.h"
#import "HZURLManageConfig.h"
#import <HZFoundation/HZFoundation.h>
@implementation NSObject (HZURLHandler)

//获取URL对应的URLHandler
+ (id<HZURLHandler>)urlHandlerForURL:(NSURL *)url
{
    NSDictionary *config = [HZURLManageConfig sharedConfig].urlMethodConfig;
    NSAssert(config.isNoEmpty, @"请先配置URL-Method-Config");
    
    NSString *host = url.host;
    NSString *path = url.path;
    NSString *scheme = url.scheme;
    NSString *pathContainHost = [NSString stringWithFormat:@"%@://%@%@",scheme.isNoEmpty?scheme:@"",host.isNoEmpty?host:@"",path.isNoEmpty?path:@""];
    NSString *className = [config objectForKey:pathContainHost];
    if (className.isNoEmpty) {
        Class class = NSClassFromString(className);
        return class != NULL?[[class alloc] init]:nil;
    }else {
        return nil;
    }
}

@end