//
//  ShowAlertURLHandler.m
//  URLManager
//
//  Created by xzh on 2017/8/11.
//  Copyright © 2017年 GeniusBrother. All rights reserved.
//

#import "ShowAlertURLHandler.h"
#import <HZURLManager/HZURLManager.h>
#import <HZFoundation/HZFoundation.h>
@interface ShowAlertURLHandler ()<HZURLHandler>

@end

@implementation ShowAlertURLHandler

/**
 hz://urlmanger.kit/doAlert
 
 @param title
 @param message
 */
- (id)handleURL:(NSURL *)url withParams:(id)params
{
    NSDictionary *queryParam = url.queryDic;
    
    NSString *title = [queryParam objectForKey:@"title"];
    NSString *message = [queryParam objectForKey:@"message"];
    
    UIAlertController *alerController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *confirmAtion = [UIAlertAction actionWithTitle:@"Confirm" style:UIAlertActionStyleDefault handler:nil];
    [alerController addAction:confirmAtion];
    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"Cancle" style:UIAlertActionStyleCancel handler:nil];
    [alerController addAction:cancleAction];
    [[HZURLNavigation currentViewController] presentViewController:alerController animated:YES completion:nil];

    return nil;
}

@end
