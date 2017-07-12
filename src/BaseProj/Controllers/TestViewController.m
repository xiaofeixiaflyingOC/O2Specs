//
//  TestViewController.m
//  BaseProj
//
//  Created by shengxin on 2017/7/5.
//  Copyright © 2017年 Autohome Inc. All rights reserved.
//

#import "TestViewController.h"
#import "RDVTabBarController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleStr = @"";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.bStatusBarStyle = BaseStatusBarStyleWhite;
    self.isCanRotate = YES;
    NSLog(@"asdfdsafadsf");
}

- (void)viewWillDisappear:(BOOL)animated{
    self.bStatusBarStyle = BaseStatusBarStyleDefault;
    self.isCanRotate = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)configDispatcherParams{

    [super configDispatcherParams];
    
    
    NSLog(@"--%@",self.dispatcherParams);
}
    
-(id)handler_show:(NSDictionary *)params{
    TestViewController *vc = [[TestViewController alloc]init];
    vc.dispatcherParams = params;
    return vc;
}

    
@end
