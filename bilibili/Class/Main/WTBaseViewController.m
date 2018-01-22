//
//  WTBaseViewController.m
//  bilibili
//
//  Created by admin on 17/9/3.
//  Copyright © 2017年 飞奔的小鲨鱼. All rights reserved.
//

#import "WTBaseViewController.h"
@interface WTBaseViewController ()

@end

@implementation WTBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = WTRandomColor;
    
    // 0.状态栏
    UIView * statusBar = [[UIView alloc] init];
    [self.view addSubview:statusBar];
    statusBar.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20);
    
    // 1.导航栏
    WTNavigationBar * navigationBar = [[WTNavigationBar alloc] init];
    self.navigationBar = navigationBar;
    [self.view addSubview:navigationBar];
    self.navigationBar.frame = CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, 44);
    
    statusBar.backgroundColor = navigationBar.backgroundColor = KNormalNavColor;
    self.navigationBar.titleLabel.textColor = [UIColor whiteColor];
    
    [self.navigationBar.leftBarButtonItem setImage:[UIImage imageWithBundleName:@"fullplayer_icon_back"] forState:UIControlStateNormal];
    
}


- (UIStatusBarStyle)preferredStatusBarStyle{
    
    return UIStatusBarStyleLightContent;
}
@end
