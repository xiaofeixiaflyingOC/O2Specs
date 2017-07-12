//
//  BaseNavigationController.h
//  ShiPinTableView
//
//  Created by shengxin on 15/11/9.
//  Copyright © 2015年 shengxin. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    BaseStatusBarStyleDefault = 0,
    BaseStatusBarStyleWhite = 1
}BaseStatusBarStyle;

@interface UINavigationController(BaseStateController)

@property (nonatomic, assign) BaseStatusBarStyle cStatusBarStyle;
@end


