//
//  BaseTabVC.m
//  nav
//
//  Created by qiaoyu on 2018/1/16.
//  Copyright © 2018年 qiaoyu. All rights reserved.
//

#import "BaseTabVC.h"
#import "QYNavBar.h"
#import "TwoVC.h"
@interface BaseTabVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)QYNavBar * qy_navigaitonBar;
@property (strong, nonatomic)  UITableView *tab;
@property (nonatomic, strong) UINavigationItem *gk_navigationItem;

@end

@implementation BaseTabVC
-(QYNavBar *)qy_navigaitonBar
{
    if (_qy_navigaitonBar == nil) {
        _qy_navigaitonBar = [[QYNavBar alloc]initWithFrame:CGRectZero];
    }
    return _qy_navigaitonBar;
    
}
- (UINavigationItem *)gk_navigationItem {
    if (!_gk_navigationItem) {
        _gk_navigationItem = [UINavigationItem new];
    }
    return _gk_navigationItem;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.qy_navigaitonBar && !self.qy_navigaitonBar.hidden) {
        [self.view bringSubviewToFront:self.qy_navigaitonBar];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES animated:NO];

    [self setupCustomNavBar];
   

}
- (void)setupCustomNavBar {
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.gk_navBackgroundColor = [UIColor colorWithRed:(200 / 255.0) green:(39 / 255.0) blue:(39 / 255.0) alpha:1];
    [self.view addSubview:self.qy_navigaitonBar];
    self.qy_navigaitonBar.items = @[self.gk_navigationItem];

    [self setupTab];
}

-(void)setupTab
{
    UITableView * tab = [[UITableView alloc]initWithFrame:CGRectZero];
    tab.delegate = self;
    tab.dataSource = self;
    [self.view addSubview:tab];
    self.tab = tab;
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    CGFloat width  = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    CGFloat systemVersion = [UIDevice currentDevice].systemVersion.floatValue;
    
    // 状态栏高度
    CGFloat statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    
    // 导航栏高度：横屏(状态栏显示：52，状态栏隐藏：32) 竖屏64
    CGFloat navBarH = 0;
    
    // 适配iOS11 iPhone X
    if (systemVersion >= 11.0) {
        navBarH = ((width > height) ? 32 : 44) + statusBarHeight;
    }else {
        navBarH = 64;
    }
    
    self.qy_navigaitonBar.frame = CGRectMake(0, 0, width, 64);
    
    

    self.tab.frame = CGRectMake(0, CGRectGetMaxY(self.qy_navigaitonBar.frame), [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - self.qy_navigaitonBar.frame.size.height);
}
-(void)setGk_navLeftBarButtonItem:(UIBarButtonItem *)gk_navLeftBarButtonItem
{
    _gk_navLeftBarButtonItem = gk_navLeftBarButtonItem;
//
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.backgroundColor = [UIColor yellowColor];
//    button.frame = CGRectMake(0, 0, 30, 30);
//    [button setImage:[UIImage imageNamed:nil] forState:UIControlStateNormal];
//    [button setTitle:@"sssssss" forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
//    [button setImageEdgeInsets:UIEdgeInsetsMake(0, -5, 0, 0)];
//    [button addTarget:nil action:nil forControlEvents:UIControlEventTouchUpInside];
//     self.gk_navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    
    self.gk_navigationItem.leftBarButtonItem = gk_navLeftBarButtonItem;

}

- (void)setGk_navBackgroundColor:(UIColor *)gk_navBackgroundColor {
    _gk_navBackgroundColor = gk_navBackgroundColor;
    
    if (gk_navBackgroundColor == [UIColor clearColor]) {
        [self.qy_navigaitonBar setBackgroundImage:[UIImage imageNamed:@"屏幕快照 2017-10-13 下午6.35.53"] forBarMetrics:UIBarMetricsDefault];
        self.qy_navigaitonBar.shadowImage = [self imageWithColor:[UIColor clearColor]];
    }else {
        [self.qy_navigaitonBar setBackgroundImage:[self imageWithColor:gk_navBackgroundColor] forBarMetrics:UIBarMetricsDefault];
    }
}

- (UIImage *)imageWithColor:(UIColor *)color {
    return [self imageWithColor:color size:CGSizeMake(1.0, 1.0)];
}



- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    
    UIGraphicsBeginImageContext(size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    static NSString *cellIndentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TwoVC * two = [[TwoVC alloc]init];
    [self.navigationController pushViewController:two animated:YES];
}

- (void)setGk_navRightBarButtonItem:(UIBarButtonItem *)gk_navRightBarButtonItem {
    _gk_navLeftBarButtonItem = gk_navRightBarButtonItem;
    
    self.gk_navigationItem.rightBarButtonItem = gk_navRightBarButtonItem;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
