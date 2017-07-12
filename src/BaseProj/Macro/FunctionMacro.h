//
//  FunctionMacro.h
//  BaseProj
//
//  Created by 王一飞 on 2017/7/4.
//  Copyright © 2017年 Autohome Inc. All rights reserved.
//

#ifndef FunctionMacro_h
#define FunctionMacro_h

#define IMG(_file) [UIImage imageNamed:_file]
#define LoadImage(_file,_suffix) [[NSBundle mainBundle]pathForResource:_file ofType:_suffix]
#define LoadBundleImage(_file,_suffix) [UIImage imageWithContentsOfFile:LoadImage(_file, _suffix)]
#define LoadBundlePNGImage(_file) LoadBundleImage(_file,@"png")

//通过16进制获取颜色
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
//RGB颜色设置
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

//获得版本号
#define GET_VERSION             [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
//格式化 string
#define STRING(_obj)           ( (_obj)?[NSString stringWithFormat:@"%@",_obj]:@"")
//设置字体
#define FONT(size)[UIFont systemFontOfSize:size]
//
#define AHD_DISPATCHER [AHDDispatcher shareInstance]
//table nib相关
#define NIB(nibName) [UINib nibWithNibName:nibName bundle:nil]
#define REGISTER_TABLE(table, nibName) [table registerNib:NIB(nibName) forCellReuseIdentifier:nibName];
//weak_strong_self_dance
#define WEAK_SELF __weak typeof(self) weakSelf = self;
#define STRONG_SELF __strong __typeof(self) strongSelf = weakSelf;
//
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define APP_KEY_WINDOW [UIApplication sharedApplication].keyWindow
#endif /* FunctionMacro_h */
