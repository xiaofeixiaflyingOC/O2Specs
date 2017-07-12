//
//  AHDDispatcher+Test.m
//  BaseProj
//
//  Created by 王一飞 on 2017/7/10.
//  Copyright © 2017年 Autohome Inc. All rights reserved.
//

#import "AHDDispatcher+Test.h"

NSString * const kCommentKey = @"test";
NSString * const kCommentForPush = @"show";

@implementation AHDDispatcher (Test)
    
-(UIViewController *)test_ViewControllerForPush:(NSDictionary *)params{

    UIViewController *viewController = [self handleTarget:kCommentKey withSelector:kCommentForPush withParams:params callFromDispatcher:YES];
    if ([viewController isKindOfClass:[UIViewController class]]) {
        return viewController;
    }
    //TODO: 初始化失败考虑错误处理
    return nil;
}
@end
