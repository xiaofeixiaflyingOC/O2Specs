//
//  BaseNavViewController.m
//  BaseProj
//
//  Created by shengxin on 2017/7/10.
//  Copyright © 2017年 Autohome Inc. All rights reserved.
//

#import "BaseNavViewController.h"
#import "RDVTabBarController.h"
@interface BaseNavViewController ()

@end

@implementation BaseNavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//- (void)viewWillAppear:(BOOL)animated{
//
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIViewController *)childViewControllerForStatusBarStyle {
    return self.visibleViewController;
}

-(UIViewController *)childViewControllerForStatusBarHidden {
    return self.visibleViewController;
}

- (BOOL)shouldAutorotate
{
    return [[self topViewController] shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return [[self topViewController] supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    
    return [[self topViewController] preferredInterfaceOrientationForPresentation];
    
}

@end
