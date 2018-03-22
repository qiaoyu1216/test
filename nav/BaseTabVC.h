//
//  BaseTabVC.h
//  nav
//
//  Created by qiaoyu on 2018/1/16.
//  Copyright © 2018年 qiaoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTabVC : UIViewController
@property (nonatomic,strong,readonly) UINavigationBar * qy_navigaitonBar;
@property (nonatomic, strong) UIBarButtonItem *gk_navLeftBarButtonItem;
@property (nonatomic, strong) UIColor *gk_navBackgroundColor;


@end
