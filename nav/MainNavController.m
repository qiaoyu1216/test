//
//  MainNavController.m
//  testNav
//
//  Created by qiaoyu on 2017/10/13.
//  Copyright © 2017年 qiaoyu. All rights reserved.
//

#import "MainNavController.h"
#import "BaseTabVC.h"
#import "UIBarButtonItem+QY.h"

@interface MainNavController ()

@end

@implementation MainNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count>0) {
        self.interactivePopGestureRecognizer.delegate = (id)self;
        viewController.hidesBottomBarWhenPushed = YES;
        if ([viewController isKindOfClass:[BaseTabVC class]]) {
            BaseTabVC *vc = (BaseTabVC *)viewController;
            
            //vc.gk_navLeftBarButtonItem = [UIBarButtonItem itemWithTitle:nil image:backImage target:self action:@selector(goBack)];
            vc.gk_navLeftBarButtonItem = [UIBarButtonItem itemWithTitle:@"assqqqqqqqqqqqqqqsssss" Image:@"返回" target:self action:@selector(goBack)];
        }
//        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]itemWithIcon:@"返回" highIcon:nil  title:nil isRed:YES  target:self action:@selector(back:)];
    }
    [super pushViewController:viewController animated:animated];
}

- (void)goBack {
    
    [self popViewControllerAnimated:YES];
}
@end
