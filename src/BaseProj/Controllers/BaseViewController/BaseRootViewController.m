//
//  BaseRootViewController.m
//  BaseProj
//
//  Created by shengxin on 2017/7/5.
//  Copyright © 2017年 Autohome Inc. All rights reserved.
//

#import "BaseRootViewController.h"
#import "RDVTabBarController.h"

@interface BaseRootViewController ()

@end

@implementation BaseRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [[self rdv_tabBarController] setTabBarHidden:NO animated:NO];
}


@end
