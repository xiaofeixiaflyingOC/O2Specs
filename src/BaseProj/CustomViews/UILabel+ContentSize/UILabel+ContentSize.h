//
//  UILabel+ContentSize.h
//  BaseProj
//
//  Created by shengxin on 2017/7/5.
//  Copyright © 2017年 Autohome Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (ContentSize)

- (CGSize)contentSize;

+ (CGSize)contentSizeForLabelWithText:(NSString *)text
                             maxWidth:(CGFloat)width
                                 font:(UIFont *)font;

+ (CGFloat)heightForLabelWithText:(NSString *)text
                         maxWidth:(CGFloat)width
                             font:(UIFont *)font;

+ (CGFloat)widthForLabelWithText:(NSString *)text
                       maxHeight:(CGFloat)height
                            font:(UIFont *)font;

@end
