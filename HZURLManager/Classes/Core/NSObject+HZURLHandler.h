//
//  NSObject+HZURLHandler.h
//  Pods
//
//  Created by xzh on 2017/7/31.
//
//

#import <Foundation/Foundation.h>
#import "HZURLHandler.h"
@interface NSObject (HZURLHandler)

+ (id<HZURLHandler> )urlHandlerForURL:(NSURL *)url;

@end
