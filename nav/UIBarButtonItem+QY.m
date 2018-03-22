//
//  UIBarButtonItem+QY.m
//  testNav
//
//  Created by qiaoyu on 2017/10/13.
//  Copyright © 2017年 qiaoyu. All rights reserved.
//

#import "UIBarButtonItem+QY.h"

@implementation UIBarButtonItem (QY)
+(UIBarButtonItem *)itemWithTitle:(NSString *)title Image:(NSString *)image  target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor yellowColor];
    button.frame = CGRectMake(0, 0, 0, 0);
    [button sizeToFit];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [button setImageEdgeInsets:UIEdgeInsetsMake(0, -5, 0, 0)];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];

}
@end
