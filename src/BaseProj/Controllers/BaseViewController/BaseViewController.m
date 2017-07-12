//
//  BaseViewController.m
//  BaseProj
//
//  Created by shengxin on 2017/7/5.
//  Copyright © 2017年 Autohome Inc. All rights reserved.
//

#import "BaseViewController.h"
#import "UIView+Utils.h"
#import "UILabel+ContentSize.h"
#import "RDVTabBarController.h"
#import "APPMacro.h"

#define navHeight 64.0f
#define segmentWidth  80.0f //按钮点击区域

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configDispatcherParams];
    [self createCustomNavBar];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[self rdv_tabBarController] setTabBarHidden:YES animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)configDispatcherParams{

    if (self.dispatcherParams.count>0) {
        self.titleStr = self.dispatcherParams[@"title"];
    }
    NSLog(@"_dispatcherParams %@",_dispatcherParams);
}

//    [[self rdv_tabBarController] setTabBarHidden:NO animated:NO];
#pragma mark - Public
- (void)createCustomNavBar{
    if(self.customNavigationView!=nil){
        return;
    }
    //navBar
    self.customNavigationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, navHeight)];
    _customNavigationView.backgroundColor = [UIColor whiteColor];
    _customNavigationView.userInteractionEnabled = YES;
    [self.view addSubview:_customNavigationView];
    // 左按钮
    _btnLeft = [[CustomButton alloc] initWithFrame:CGRectMake(0, _customNavigationView.height_ - kNavigationHeight, segmentWidth, kNavigationHeight)];
    _btnLeft.showBackArrow = YES;
    _btnLeft.tag = TopBarButtonLeft;
    _btnLeft.adjustsImageWhenHighlighted = NO;
    _btnLeft.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    _btnLeft.titleLabel.font = kFontMiddle;
    _btnLeft.titleEdgeInsets = UIEdgeInsetsMake(0, kEdgeInsetsLeft - 4, 0, 0);
    _btnLeft.imageEdgeInsets = UIEdgeInsetsMake(0, kEdgeInsetsLeft, 0, 0);
    _btnLeft.exclusiveTouch = YES;
    [_btnLeft setTitle:@"返回" forState:UIControlStateNormal];
    [_btnLeft addTarget:self action:@selector(onClickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_btnLeft setTitleColor:kNavBackTitleColorNavigationTitle forState:UIControlStateNormal];
    [_btnLeft setTitleColor:kNavBackTitleColorNavigationTitleDisable forState:UIControlStateDisabled];
    // 右按钮
    _btnRight = [[CustomButton alloc] initWithFrame:CGRectMake(_customNavigationView.width_ - segmentWidth - 10, _customNavigationView.height_ - kNavigationHeight, segmentWidth + 10, kNavigationHeight)];
    _btnRight.showBackArrow = NO;
    _btnRight.tag = TopBarButtonRight;
    _btnRight.adjustsImageWhenHighlighted = NO;
    _btnRight.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    _btnRight.titleLabel.font = kFontMiddle;
    _btnRight.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, kEdgeInsetsLeft);
    _btnRight.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, kEdgeInsetsLeft);
    _btnRight.exclusiveTouch = YES;
    [_btnRight addTarget:self action:@selector(onClickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [_btnRight setTitleColor:kNavRightColorNavigationTitle forState:UIControlStateNormal];
    [_btnRight setTitleColor:kNavRightColorNavigationTitleDisable forState:UIControlStateDisabled];
    //title
    _titleLb = [[UILabel alloc] initClearColorWithFrame:CGRectMake(0, 0, _customNavigationView.width_ - _btnLeft.width_ - _btnRight.width_, kNavigationHeight)];
    _titleLb.frame = CGRectMake(0, 0,_customNavigationView.width_ - _btnLeft.width_ - _btnRight.width_, kNavigationHeight);
    _titleLb.center = CGPointMake(_customNavigationView.center.x, _customNavigationView.height_ - kNavigationHeight / 2);
    _titleLb.font = KNavFontSize;
    _titleLb.textColor = kColorNavigationTitle;
    _titleLb.textAlignment = NSTextAlignmentCenter;
    [_customNavigationView addSubview:_titleLb];
    [_customNavigationView addSubview:_btnLeft];
    [_customNavigationView addSubview:_btnRight];
    //添加分割线
    self.barLineView = [[UIView alloc] initWithFrame:CGRectMake(0, _customNavigationView.maxY - 0.5, _customNavigationView.width_, 0.5)];
    _barLineView.backgroundColor = RGBCOLOR(0xd8, 0xd8, 0xd8);
    [_customNavigationView addSubview:_barLineView];
    //设置内容
    _titleLb.text = _titleStr;
}

- (void)setCustomBarHidden:(BOOL)isHidden{
    self.customNavigationView.hidden = isHidden;
}

- (void)setTitleStr:(NSString *)titleStr{
    _titleStr = titleStr;
    _titleLb.text = _titleStr;
}

- (void)setBStatusBarStyle:(BaseStatusBarStyle)bStatusBarStyle{
    if(self.navigationController){
        self.navigationController.cStatusBarStyle = bStatusBarStyle;
        [self.navigationController setNeedsStatusBarAppearanceUpdate];
    }
}

#pragma mark -IBAction
- (void)onClickBtn:(UIButton *)sender{
    if (sender.tag == TopBarButtonLeft) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark - rotate
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    if (self.isCanRotate==YES) {
        return UIInterfaceOrientationMaskAll;
    }
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return UIInterfaceOrientationPortrait;
}
@end

@implementation CustomButton

- (void)setTitle:(NSString *)title forState:(UIControlState)state{
    if (self.showBackArrow) {
        [self setImage:[UIImage imageNamed:@"btn_back"] forState:UIControlStateNormal];
    }else{
        [self setImage:nil forState:UIControlStateNormal];
    }
    [super setTitle:title forState:state];
}



@end
