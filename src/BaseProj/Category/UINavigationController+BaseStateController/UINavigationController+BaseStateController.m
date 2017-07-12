//
//  BaseNavigationController.m
//  ShiPinTableView
//
//  Created by shengxin on 15/11/9.
//  Copyright © 2015年 shengxin. All rights reserved.
//

#import "UINavigationController+BaseStateController.h"
#import <objc/runtime.h>

static char statusBarStyle;
#define kStatusTypeArray [NSArray arrayWithObjects:@"0", @"1",nil]
@implementation UINavigationController(BaseStateController)

#pragma mark -
#pragma mark iOS7StatusChangeMethod

- (BaseStatusBarStyle)cStatusBarStyle{
    NSString *type = objc_getAssociatedObject(self, &statusBarStyle);

    BaseStatusBarStyle style = (BaseStatusBarStyle)[type integerValue];
    return style;
}

-(void)setCStatusBarStyle:(BaseStatusBarStyle)cStatusBarStyle{
    NSString *type = [kStatusTypeArray objectAtIndex:cStatusBarStyle];
    objc_setAssociatedObject(self, &statusBarStyle, type,OBJC_ASSOCIATION_COPY_NONATOMIC);
    
}
#pragma mark -UIStatusBar
- (UIStatusBarStyle)preferredStatusBarStyle
{
    switch (self.cStatusBarStyle) {
        case BaseStatusBarStyleDefault:
            return UIStatusBarStyleDefault;
        case BaseStatusBarStyleWhite:
        default:
            return UIStatusBarStyleLightContent;
    }
}

- (UIViewController *)childViewControllerForStatusBarStyle{
    return self.topViewController;
}

- (BOOL)prefersStatusBarHidden{
    return NO;
}
@end
