//
//  BaseViewController.h
//  BaseProj
//
//  Created by shengxin on 2017/7/5.
//  Copyright © 2017年 Autohome Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UINavigationController+BaseStateController.h"

@interface CustomButton : UIButton
@property (nonatomic) BOOL showBackArrow;
@end

typedef enum {
    TopBarButtonLeft = 1,
    TopBarButtonRight = 2,
} NavBarButton;

@interface BaseViewController : UIViewController
@property (nonatomic, strong) CustomButton *btnLeft;
@property (nonatomic, strong) UILabel *titleLb;
@property (nonatomic, strong) CustomButton *btnRight;
@property (nonatomic, strong) NSString *titleStr;
@property (nonatomic, strong) UIView *customNavigationView;
@property (nonatomic, strong) UIView *barLineView;
@property (nonatomic, assign) BaseStatusBarStyle bStatusBarStyle;
@property (nonatomic, assign) BOOL isCanRotate;
    
//dispatcher 跳转初始化需要的参数
@property (nonatomic, copy) NSDictionary *dispatcherParams;
-(void)configDispatcherParams;
- (void)createCustomNavBar;
- (void)setCustomBarHidden:(BOOL)isHidden;
@end
