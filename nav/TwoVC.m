//
//  TwoVC.m
//  nav
//
//  Created by qiaoyu on 2018/1/16.
//  Copyright © 2018年 qiaoyu. All rights reserved.
//

#import "TwoVC.h"
#import "UIBarButtonItem+QY.h"
@interface TwoVC ()

@end

@implementation TwoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.gk_navLeftBarButtonItem = [UIBarButtonItem itemWithTitle:@"返回" Image:nil target:self action:@selector(goBack)];

    self.gk_navBackgroundColor = [UIColor colorWithRed:(144 / 255.0) green:(144 / 255.0) blue:(144 / 255.0) alpha:1];
//    self.gk_navLeftBarButtonItem = [UIBarButtonItem itemWithTitle:@"sdfdsfsdf" Image:@"返回" target:self action:@selector(goBack)];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
