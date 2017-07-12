//
//  APPMacro.h
//  BaseProj
//
//  Created by 王一飞 on 2017/7/4.
//  Copyright © 2017年 Autohome Inc. All rights reserved.
//

#ifndef APPMacro_h
#define APPMacro_h

/*
 
 1.import headers:
 #import "Aspects.h"
 
 2.define key strings:
 static NSString *kCityCode = @"110100";
 */

#import "NotificationMarco.h"
#import "EnumerationMacro.h"
#import "FunctionMacro.h"
#import "SDVersion.h"
#import "XMNetworking.h"
#import "AHDDispatcherFullHeader.h"

#define ISSMALLIPHONE       ([SDVersion deviceSize] == Screen3Dot5inch||[SDVersion deviceSize] == Screen4inch)
#define kScreenWidth            [UIScreen mainScreen].bounds.size.width
#define kScreenHeight           [UIScreen mainScreen].bounds.size.height

#define kStatusBarHeight        20.f    //状态栏高度
#define kNavigationHeight       44.f    //导航栏高度
#define kEdgeInsetsLeft         10.f    //间距
#define kNavBackTitleColorNavigationTitle       RGBCOLOR(0x48, 0x48, 0x48)//返回按钮颜色
#define kNavBackTitleColorNavigationTitleDisable       RGBACOLOR(0x44, 0x44, 0x44, 0.5)
#define kNavRightColorNavigationTitle       RGBCOLOR(0x48, 0x48, 0x48)//右侧按钮颜色
#define kNavRightColorNavigationTitleDisable       RGBACOLOR(0x44, 0x44, 0x44, 0.5)
#define kColorNavigationTitle       RGBCOLOR(0x48, 0x48, 0x48)
#define kColorNavigationTitleDisable       RGBACOLOR(0x44, 0x44, 0x44, 0.5)
#define KNavFontSize (ISSMALLIPHONE?kFontMiddle_1_b:kFontSuper_b)

#define kFontMiddle        [UIFont systemFontOfSize:15.0f]
#define kFontSuper              [UIFont systemFontOfSize:20.0]
#define kFontSuper_b            [UIFont boldSystemFontOfSize:18.0]
#define kFontLarge_1            [UIFont systemFontOfSize:17.0]
#define kFontLarge_1_b          [UIFont boldSystemFontOfSize:17.0]
#define kFontMiddle_1_b          [UIFont boldSystemFontOfSize:15.0]

#endif /* APPMacro_h */
